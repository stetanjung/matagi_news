import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  Network(this.url);

  final String url;
  
  // connect to the internet and return the JSON data received from the url
  Future getData() async{
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
    } else{
      print(response.statusCode);
    }
  }
}