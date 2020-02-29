import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class signup3Page extends StatelessWidget {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SingleChildScrollView(
          child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(22, 57, 22, 0),
              child: Text(
                "Almost Done !",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: _textColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(22, 17, 22, 0),
              child: Text(
                "Now choose a profile picture, tap on tha camera icon",
                style: TextStyle(
                    letterSpacing: 2, color: _textFieldBackgroundColor),
              ),
            ),
            Center(
              child: IconButton(
                padding: EdgeInsets.all(35),
                iconSize: 150,
                color: _textFieldBackgroundColor,
                icon: Icon(
                  Icons.account_circle,
                ), onPressed: () {  },
              ),
            ),
            new Padding(
              padding: EdgeInsets.fromLTRB(22, 16, 22, 0),
              child: new ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                child: new RaisedButton(
                  textColor: Colors.white,
                  color: _accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => loginPage()),
                    );
                  },
                  child: Text(
                    "DONE",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Image.asset(
                    "assets/img/junctionx_algiers_white_oneline.png",
                    width: 200,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
