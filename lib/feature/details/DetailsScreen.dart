import 'package:crypto_conversion/domain/response/CoinResponse.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  Data data;

  DetailsScreen(Data data) {
    this.data = data;
  }

  @override
  _DetailsScreenState createState() => _DetailsScreenState(data);
}

class _DetailsScreenState extends State<DetailsScreen> {
  Data data;

  _DetailsScreenState(Data data) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
        actions: [],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Name",
                    textAlign: TextAlign.center,
                    style: getStyle(),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.name,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Price",
                    textAlign: TextAlign.center,
                    style: getStyle(),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.priceBtc,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Price Usd",
                    textAlign: TextAlign.center,
                    style: getStyle(),
                  ),
                ),
                Expanded(
                  child: Text(data.priceUsd, textAlign: TextAlign.center),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Symbol",
                    textAlign: TextAlign.center,
                    style: getStyle(),
                  ),
                ),
                Expanded(
                  child: Text(data.symbol, textAlign: TextAlign.center),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

getStyle() {
  return TextStyle(
    color: Colors.indigo,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}
