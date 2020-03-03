import 'dart:async';

import 'package:flutter/material.dart';
import 'package:junctionx_algiers/screens/login.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textFieldBackgroundColor = const Color(0xff797979);

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => homePage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/img/junctionx_algiers_white_oneline.png',
                  width: 200,
                )),
          ),
          Expanded(
            flex: 2,
            child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/img/JUNCTION_X_white.png',
                  width: 250,
                )),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text("POWERED BY CELEC",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: _textFieldBackgroundColor)),
            ),
          )
        ],
      ),
    );
  }
}
