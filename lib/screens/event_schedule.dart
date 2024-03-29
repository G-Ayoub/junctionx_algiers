import 'package:flutter/material.dart';

import 'widgets/FirebaseMessageWrapper.dart';

class EventSchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EventSchedulePage();
}

class _EventSchedulePage extends State<EventSchedulePage> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _eventBtnColor = const Color(0xff24262a);
  int daySelected = 1;

  Widget getDay(int i) {
    switch (i) {
      case 1:
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "12:00",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "16:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Team building",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "21:00",
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
        );
      case 2:
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "07:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Breakfast",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "10:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Workshops",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "12:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Lunch",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "16:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Workshops",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "21:00",
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
                  )
                ],
              ),
            ),
            Container(
              color: _textFieldBackgroundColor,
              height: 1,
            ),
          ],
        );
      case 3:
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "07:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Breakfast",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "10:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "End of Hack",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "10:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Pitch to companies",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "12:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Lunch and Photoshoots",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "13:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Pitch to participants",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "16:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Announcement of winners",
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
        );
      default:
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "12:00",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "16:00",
                        style: TextStyle(color: _textColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Team building",
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: _accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "21:00",
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
        );
    }
  }

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
      body: FirebaseMessageWrapper(
        Column(
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
                    onPressed: () {
                      setState(() {
                        daySelected = 1;
                      });
                    },
                    textColor: _textColor,
                    color: daySelected == 1 ? _accentColor : _eventBtnColor,
                    child: Text("DAY1"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        daySelected = 2;
                      });
                    },
                    textColor: _textColor,
                    color: daySelected == 2 ? _accentColor : _eventBtnColor,
                    child: Text("DAY2"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        daySelected = 3;
                      });
                    },
                    textColor: _textColor,
                    color: daySelected == 3 ? _accentColor : _eventBtnColor,
                    child: Text("DAY3"),
                  )
                ],
              ),
            ),
            getDay(daySelected),
          ],
        ),
      ),
    );
  }
}
