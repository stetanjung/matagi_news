import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:mataginews/util/auth.dart';

import 'package:mataginews/screen/searchScreen.dart';
import 'package:mataginews/screen/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkUser() async{
    AuthGoogle auth = AuthGoogle();
    var logged = await auth.userLogged();
    if(logged == true)
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchScreen()));
    else{
      await new Future.delayed(new Duration(seconds: 3), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkUser();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/mataginews.jpg'),
            SizedBox(height: 10.0,),
            SpinKitCubeGrid(
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}