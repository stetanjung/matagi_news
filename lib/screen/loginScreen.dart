import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:mataginews/util/auth.dart';

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
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/mataginews.jpg'),
            ),
            GoogleSignInButton(
              onPressed: (){
                auth.signInWithGoogle();
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