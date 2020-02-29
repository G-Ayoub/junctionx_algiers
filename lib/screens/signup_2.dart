import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junctionx_algiers/screens/signup_3.dart';

class signup2Page extends StatelessWidget {
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
                "Few steps to go",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: _textColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(22, 37, 22, 0),
              child: Theme(
                data: new ThemeData(
                    primaryColor: _accentColor, hintColor: Colors.white),
                child: new TextField(
                    //controller: ndInput,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Table number",
                        filled: true,
                        fillColor: _textFieldBackgroundColor,
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.circular(5.0),
                        ))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(22, 7, 22, 0),
              child: Theme(
                data: new ThemeData(
                    primaryColor: _accentColor, hintColor: Colors.white),
                child: new TextField(
                    //controller: ndInput,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Your function",
                        filled: true,
                        fillColor: _textFieldBackgroundColor,
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.circular(5.0),
                        ))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(22, 7, 22, 0),
              child: Theme(
                data: new ThemeData(
                    primaryColor: _accentColor, hintColor: Colors.white),
                child: new TextField(
                    //controller: ndInput,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Fav Movie",
                        filled: true,
                        fillColor: _textFieldBackgroundColor,
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.circular(5.0),
                        ))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(22, 7, 22, 0),
              child: Theme(
                data: new ThemeData(
                    primaryColor: _accentColor, hintColor: Colors.white),
                child: new TextField(
                    //controller: ndInput,
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: null,
                    decoration: InputDecoration(
                        labelText: "About you",
                        filled: true,
                        fillColor: _textFieldBackgroundColor,
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.circular(5.0),
                        ))),
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
                      MaterialPageRoute(builder: (context) => signup3Page()),
                    );
                  },
                  child: Text(
                    "NEXT",
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
