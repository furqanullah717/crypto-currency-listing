import 'package:http/http.dart' as http;

class ApiService{

 Future<http.Response> fetchAlbum() async {
    final res = await http.get('https://api.coinlore.net/api/tickers/');
    if (res.statusCode == 200) {
      return res;
    } else {
      throw Exception('Failed to load album');
    }
  }
}