import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:junctionx_algiers/util/validator.dart';

import 'widgets/FirebaseMessageWrapper.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {
  //final Firestore databaseReference = Firestore.instance;
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
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('notification')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Center(child: new CircularProgressIndicator());
                    default:
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, i) {
                              return createNotification(
                                  snapshot.data.documents[i].data['message'],
                                  snapshot.data.documents[i].data['time']);
                            });
                      } else {
                        return null;
                      }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createNotification(
      String notificationMsg, Timestamp notificationTime) {
    return Padding(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "$notificationMsg",
                style: TextStyle(
                  color: _textColor,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Text(
              Validator.readTimestamp(notificationTime.seconds),
              style: TextStyle(
                color: _textFieldBackgroundColor,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
