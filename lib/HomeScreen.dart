import 'dart:convert';

import 'package:crypto_conversion/data/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:crypto_conversion/CoinResponse.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  createListElementRow(Data data) {
    return addToContainer(
      Row(
        children: <Widget>[
          Expanded(
            child: Icon(Icons.access_alarms),
          ),
          Expanded(
            child: getElementText(data.name),
          ),
          Expanded(
            child: getElementText(data.priceBtc),
          ),
          Expanded(
            child: getElementText(data.priceUsd),
          ),
        ],
      ),
    );
  }

  addToContainer(Row row) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
      ),
      child: Container(
        margin: new EdgeInsets.only(bottom: 20.0),
        child: row,
      ),
    );
  }

  Future<Widget> fetchAlbum() async {
    ApiService service = new ApiService();
    var res = await service.fetchAlbum();
    List<Widget> listOfElement = new List<Widget>();
    listOfElement.add(
      new Text(""),
    );
    var response = CoinsResponse.fromJson(jsonDecode(res.body));
    response.data.forEach((element) {
      listOfElement.add(ListTile(title: createListElementRow(element)));
    });
    return createBuilderList(listOfElement);
  }

  createBuilderList(List<Widget> listOfElement) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          // return the header
          return InkWell(
            child: getHeaderTitle(),
          );
        }
        // return row
        return new InkWell(
          child: listOfElement[index],
        );
      },
    );
  }

  getStyle() {
    return TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
  }
  getHeaderText(String data) {
    return Text(data, textAlign: TextAlign.center, style: getStyle());
  }
  getElementText(String data) {
    return Center(
      child: Text(
        data,
        textAlign: TextAlign.center,
      ),
    );
  }

  getHeaderTitle() {
    return addToContainer(
      Row(
        children: <Widget>[
          Expanded(
            child: getHeaderText(""),
          ),
          Expanded(
            child: getHeaderText("Coin"),
          ),
          Expanded(
            child: getHeaderText("Value"),
          ),
          Expanded(
            child: getHeaderText("USD"),
          ),
        ],
      ),
    );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 20),
          Flexible(
            fit: FlexFit.loose,
            child: FutureBuilder<Widget>(
                future: fetchAlbum(),
                builder:
                    (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                  if (snapshot.hasData) return snapshot.data;
                  return Container(child: CircularProgressIndicator());
                }),
          ),
        ],
      )),
    );
  }
}
