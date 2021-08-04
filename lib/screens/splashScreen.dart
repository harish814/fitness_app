import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../home_page.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool loogedin;
  Future getValidationData() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var loggedIn = pref.getBool('loogedIN');
    setState(() {
      loogedin = loggedIn;
    });
  }

  void initState() {
    getValidationData().whenComplete(() async{
      Timer(Duration(seconds: 2), () {
        if(loogedin == true){
          return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false);
        }
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LogginScreen()),
                (Route<dynamic> route) => false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.cover
            ),
            color: Color(0xff000a33),
          ),
        child: Center(
          child: Text(
            'Loading...',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        )
      ),
    );
  }
}