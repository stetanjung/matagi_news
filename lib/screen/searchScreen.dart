import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:mataginews/util/auth.dart';
import 'package:mataginews/util/news.dart';

import 'package:mataginews/screen/loginScreen.dart';
import 'package:mataginews/screen/newsScreen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  AuthGoogle authGoogle = AuthGoogle();
  News news = News();
  var newsData;
  bool loadingScreen;

  Widget updateUI(dynamic data) {
    print(data);
    ListView myList = ListView.separated(
      itemCount: data['articles'].length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: data['articles'][index]['urlToImage'] != null
              ? Image.network(data['articles'][index]['urlToImage'],
                  width: 100.0, height: 100.0)
              : SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Icon(
                    Icons.broken_image,
                    size: 50.0,
                  ),
                ),
          title: Text(data['articles'][index]['title']),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewsScreen(data['articles'][index])));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

    return myList;
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
            onPressed: () {
              authGoogle.signOutGoogle();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: 'What would you like to search?',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          newsData = await news.getData(query);
                          setState(() {
                            loadingScreen = true;
                          });
                        })),
                onChanged: (value) {
                  query = value;
                },
                onSubmitted: (value) async {
                  newsData = await news.getData(query);
                  setState(() {
                    loadingScreen = true;
                  });
                },
              ),
            ),
            Expanded(
                child: (newsData == null)
                    ? (loadingScreen == true)
                        ? SpinKitCircle(
                          color: Colors.white,
                        ) 
                        : Container(
                            child: null,
                          )
                    : updateUI(newsData)),
          ],
        ),
      ),
    );
  }
}
