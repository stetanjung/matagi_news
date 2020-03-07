import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:mataginews/util/auth.dart';
import 'package:mataginews/screen/searchScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthGoogle auth = AuthGoogle();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/mataginews.jpg'),
            ),
            GoogleSignInButton(
              onPressed: () async{
                auth.signInWithGoogle();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              darkMode: true,
              borderRadius: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}