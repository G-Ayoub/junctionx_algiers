import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);

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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
            ),
            child: Container(
              width: double.infinity,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: _accentColor),
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new NetworkImage(
                                    "https://www.woolha.com/media/2019/06/buneary.jpg")))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "YASSER GHAZALI",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "Developer",
                      style: TextStyle(
                          fontSize: 16, color: _textFieldBackgroundColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5, left: 22, right: 22, bottom: 10),
                    child: Text(
                      "I like to receive and deal with challenging tasks. I am a very enthusiastic student and I think this is a strong point of mine.",
                      style: TextStyle(
                          fontSize: 16, color: _textFieldBackgroundColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 22.0, right: 22.0, top: 15, bottom: 15),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Email Address",
                  style:
                      TextStyle(fontSize: 16, color: _textFieldBackgroundColor),
                ),
                Spacer(),
                Text(
                  "Ghazli@gmail.com",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            color: _textFieldBackgroundColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 22.0, right: 22.0, top: 15, bottom: 15),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Fav Movie",
                  style:
                      TextStyle(fontSize: 16, color: _textFieldBackgroundColor),
                ),
                Spacer(),
                Text(
                  "The lord of the ring",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            color: _textFieldBackgroundColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 22.0, right: 22.0, top: 15, bottom: 15),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Table Number",
                  style:
                      TextStyle(fontSize: 16, color: _textFieldBackgroundColor),
                ),
                Spacer(),
                Text(
                  "T123",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            color: _textFieldBackgroundColor,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 22.0, right: 22.0, top: 15, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Number of visitors",
                  style:
                      TextStyle(fontSize: 16, color: _textFieldBackgroundColor),
                ),
                Spacer(),
                Text(
                  "13",
                  style: TextStyle(fontSize: 16, color: Colors.white),
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
