import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mataginews/util/network.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({this.query});
  final String query;
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Network network = Network();
  void getNews() async {
    Network network = Network();
    var result = await network.getData(widget.query);
    print(result);
  }

  @override
  void initState() {
    // TODO: implement initState
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
            icon: Icon(FontAwesomeIcons.signOutAlt),
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
