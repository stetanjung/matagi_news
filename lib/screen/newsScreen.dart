import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen(this.data);
  final data;
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String imageUrl = '';
  String title = '';
  String author = '';
  String desc = '';
  String content = '';

  @override
  void initState() {
    super.initState();
    imageUrl = widget.data['urlToImage'];
    title = widget.data['title'];
    author = widget.data['author'];
    desc = widget.data['description'];
    content = widget.data['content'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              (imageUrl != null)
                  ? Image.network(imageUrl)
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      child: Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 100.0,
                        ),
                      ),
                    ),
              // title
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // author
              SizedBox(
                height: 10.0,
              ),
              Text(
                'created by: ${author.replaceAll(new RegExp(r'[^\w\s]+'), '')}',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 10.0),
              ),
              // description
              SizedBox(
                height: 10.0,
              ),
              Text(
                desc,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.grey),
              ),
              // content
              SizedBox(
                height: 20.0,
              ),
              Text(
                content,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Powered by NewsApi.org',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.0),
              )
              // RichText(
              //   text: TextSpan(children: [
              //     TextSpan(text: content.substring(0, content.indexOf('[+'))),
              //     InkWell(),
              //     TextSpan(
              //         text: content.substring(content.indexOf('[+')),
              //         style: TextStyle(color: Colors.blue),
              //         recognizer: TapGestureRecognizer()
              //           ..onTap = () {
              //             launch(url);
              //           }
              //         //  TapGestureRecognizer()
              //         //     ..onTap = () { launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
              //         //   },
              //         )
              //   ]),
              // ),
            ],
          ),
        ));
  }
}
