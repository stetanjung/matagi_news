import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:mataginews/util/auth.dart';
import 'package:mataginews/screen/searchScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthGoogle authGoogle = AuthGoogle();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/mataginews.jpg'),
            ),
            GoogleSignInButton(
              onPressed: () async {
                var loggedin = await authGoogle.signInWithGoogle();
                if (loggedin != null)
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                else
                  LoginScreen();
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
