import 'package:http/http.dart';

class Network{
  void getData(String query){
    String type = 'top-headlines';
    // String type = 'everything';
    String url = 'http://newsapi.org/v2/$type?q=$query';
  }
}