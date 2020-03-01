import 'package:flutter/material.dart';

class EventSchedulePage extends StatelessWidget {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _eventBtnColor = const Color(0xff24262a);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/junctionx_algiers_white_oneline.png',
            width: 200),
        backgroundColor: _backgroundColor,
        iconTheme: IconThemeData(color: _accentColor),
      ),
      backgroundColor: _backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "EVENT SCHEDULE",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: _textColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  textColor: _textColor,
                  color: _accentColor,
                  child: Text("DAY1"),
                ),
                RaisedButton(
                  onPressed: () {},
                  textColor: _textColor,
                  color: _eventBtnColor,
                  child: Text("DAY2"),
                ),
                RaisedButton(
                  onPressed: () {},
                  textColor: _textColor,
                  color: _eventBtnColor,
                  child: Text("DAY3"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: _accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "09:00",
                      style: TextStyle(color: _textColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Doors open",
                    style: TextStyle(color: _textColor),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: _textFieldBackgroundColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: _accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "14:00",
                      style: TextStyle(color: _textColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Opening ceremony",
                    style: TextStyle(color: _textColor),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: _textFieldBackgroundColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: _accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "15:00",
                      style: TextStyle(color: _textColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Presentations of challenges",
                    style: TextStyle(color: _textColor),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: _textFieldBackgroundColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: _accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "17:00",
                      style: TextStyle(color: _textColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Hacking starts",
                    style: TextStyle(color: _textColor),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: _textFieldBackgroundColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: _accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "20:00",
                      style: TextStyle(color: _textColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Dinner",
                    style: TextStyle(color: _textColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: _textFieldBackgroundColor,
            height: 1,
          ),
        ],
      ),
    );
  }
}
