import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'MessageSteam.dart';

class FirebaseNotificationService {
  FirebaseNotificationService._internal() {
    // save the client so that it can be used else where
    _firebaseMessaging = FirebaseMessaging();
    // setup listeners
    firebaseCloudMessagingListeners();
  }


  static final FirebaseNotificationService _instance =
  FirebaseNotificationService._internal();

  static FirebaseNotificationService get instance {
    return _instance;
  }

  // get the message stream
  MessageStream _messageStream = MessageStream.instance;
  FirebaseMessaging _firebaseMessaging;

  // getter for firebase messaging client
  get firebaseMessaging => _firebaseMessaging;

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) getIOSPermission();
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');

        // add message to stream
        _messageStream.addMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void getIOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
}