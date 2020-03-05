import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage>{
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _eventBtnColor = const Color(0xff24262a);
  final List<String> notification = new List<String>();


  @override
  void initState() {
    super.initState();
    _fcm.subscribeToTopic('all');
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );
  }

  List<Widget> getNotifications(List notification){
    var notificationsWidgets = List<Widget>();
    for(var notification in notification){
      notificationsWidgets.add(
        Padding(
          padding: EdgeInsets.only(top: 20, left: 22),
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/img/JUNCTION_X_white.png",
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "JunctionX",
                  style: TextStyle(
                    color: _textFieldBackgroundColor,
                    fontSize: 10,
                  ),
                ),
              ),
              Text(
                " $notification",
                style: TextStyle(
                  color: _textColor,
                  fontSize: 10,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 22),
                child: Text(
                  "10 min ago",
                  style: TextStyle(
                    color: _textFieldBackgroundColor,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return notificationsWidgets;
  }

  @override
  Widget build(BuildContext context) {

    notification.add("Dinner will be served in 20 Min");
    notification.add("20 people viewed your profile");
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/junctionx_algiers_white_oneline.png',
            width: 200),
        backgroundColor: _backgroundColor,
        iconTheme: IconThemeData(color: _accentColor),
      ),
      backgroundColor: _backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(22, 37, 22, 0),
            child: Text(
              "NOTIFICATIONS",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: _textColor),
            ),
          ),
          Column(children: getNotifications(notification),)
        ],
      ),
    );
  }
}
