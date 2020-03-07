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
  void getNews() async{
    Network network =  Network();
    var result = await network.getData(widget.query);
    print(result);
  }

  @override
  void initState() async{
    // TODO: implement initState
    super.initState();
    await network.getData(widget.query);
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
            onPressed: (){},
          )
        ],
      ),
      body: Text('data'),
    );
  }
}