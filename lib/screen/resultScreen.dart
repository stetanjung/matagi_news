import 'package:flutter/material.dart';
import 'package:mataginews/util/news.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({this.query});
  final String query;
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  News news = News();
  void getNews() async {
    News news = News();
    var result = await news.getData(widget.query);
    print(result);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Matagi News'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide()),
              ),
              child: ListTile(
                leading: Image.network(
                  'https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F1201532601%2F0x0.jpg',
                ),
                title: Text(
                    'Major Bitcoin Exchange LocalBitcoins Is In Big Trouble',
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
