import 'package:flutter/material.dart';
import 'package:mataginews/screen/resultScreen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Matagi News'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value){
                query = value;
              },
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()));
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}