import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  Future<dynamic> getData(String query) async{
    DateTime pastWeek = DateTime.now().subtract(Duration(days: 7));
    String fromDate = '${pastWeek.year}-${pastWeek.month}-${pastWeek.day}';
    String apiKey = '16412f30bffe46a19c89113ab45a1434';
    String url = 'http://newsapi.org/v2/everything?q=$query&from=$fromDate&sortBy=publishedAt&apiKey=$apiKey';

    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
    } else{
      print(response.statusCode);
    }
  }
}