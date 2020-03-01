import 'package:flutter/material.dart';
import 'package:junctionx_algiers/screens/chatScreen.dart';
import 'package:junctionx_algiers/screens/home_page.dart';
import 'package:junctionx_algiers/screens/login.dart';
import 'package:junctionx_algiers/screens/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JUNCTION X ALGEIERS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xff1c1e21),
      ),
      home: signUpPage(),
    );
  }
}

