import 'package:mataginews/util/network.dart';

class News{
  // api key to access the API
  String _apiKey = '16412f30bffe46a19c89113ab45a1434';

  // the data taken from taken start from D-7 to today
  // return the newsData in JSON format
  Future<dynamic> getData(String query) async{
    DateTime pastWeek = DateTime.now().subtract(Duration(days: 7));
    String fromDate = '${pastWeek.year}-${pastWeek.month}-${pastWeek.day}';
    String url = 'http://newsapi.org/v2/everything?language=id&q=$query&from=$fromDate&sortBy=publishedAt&apiKey=$_apiKey';

    Network network = Network(url);

    var newsData = await network.getData();

    return newsData;
  }
}