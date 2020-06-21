import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiConnection{
  String basePath = 'https://api.imgur.com/3';
  String apiKey = '1ceddedc03a5d71';

  Future<List> getImages(int offset) async {
    String _query = 'cats';
    String getUrl = '$basePath/gallery/search?q=$_query';
    print(getUrl);
    http.Response response = await http.get(
      getUrl,
      headers: {
        "Authorization": 'Client-ID $apiKey'
      }
    );
    print(response.statusCode);
    List lista = [];
    if(response.statusCode == 200) {
      for (int i = offset * 1; i <= offset * 6; i++) {
        lista.add(json.decode(response.body)['data'][i]['images'][0]['link']);
      }
      print(lista);
      return lista;
    }
    else
      return null;
  }
}