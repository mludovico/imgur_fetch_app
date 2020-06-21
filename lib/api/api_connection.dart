import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiConnection{
  String basePath = 'https://api.imgur.com/3';
  String apiKey = '1ceddedc03a5d71';

  Future<List> getImages(int offset) async {
    String _query = 'cats';
    String getUrl = '$basePath/gallery/search?q=$_query&q_type=jpeg';
    print(getUrl);
    http.Response response = await http.get(
      getUrl,
      headers: {
        "Authorization": 'Client-ID $apiKey'
      }
    );
    print(response.statusCode);
    if(response.statusCode == 200) {
      var responseObject = json.decode(response.body);
      //print(responseObject['data']);
      var items = responseObject['data'].map((item){
        return item['images'].where((image)=>image['type'] == 'image/jpeg').toList();
      });
      items.where((item)=>item != null).where((item)=>!item.isEmpty).forEach((item){
        print(item[0]['type']);
        print(item[0]['link']);
      }
      );
      var links = items.where((item)=>item != null).where((item)=>!item.isEmpty)
        .map((item)=>item[0]['link']).toList();
      print(links);
      return links;
    }
    else
      return null;
  }
}