import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junctionx_algiers/models/state.dart';
import 'package:junctionx_algiers/util/state_widget.dart';

import 'editProfile.dart';
import 'login.dart';
import 'widgets/FirebaseMessageWrapper.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);

  StateModel appState;
  bool _loadingVisible = false;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    if (!appState.isLoading &&
        (appState.firebaseUserAuth == null ||
            appState.user == null ||
            appState.settings == null)) {
      return loginPage();
    } else {
      if (appState.isLoading) {
        _loadingVisible = true;
      } else {
        _loadingVisible = false;
      }
    }
    final email = appState?.firebaseUserAuth?.email ?? '';
    final firstName = appState?.user?.firstName ?? '';
    final lastName = appState?.user?.lastName ?? '';
    final tableNumber = appState?.user?.tableNumber ?? '';
    final function = appState?.user?.function ?? '';
    final favMovie = appState?.user?.favMovie ?? '';
    final visitorNumber = appState?.user?.visitorNumber ?? '';
    final aboutYou = appState?.user?.aboutYou ?? '';
    final imgUrl = appState?.user?.imgUrl ?? '';


    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/junctionx_algiers_white_oneline.png',
            width: 200),
        backgroundColor: _backgroundColor,
        iconTheme: IconThemeData(color: _accentColor),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit, size: 30, color: _accentColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
              //StateWidget.of(context).logOutUser();
            },
          )
        ],
      ),
      backgroundColor: _backgroundColor,
      body: FirebaseMessageWrapper(
        Column(
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
                      child: CachedNetworkImage(
                        imageUrl: imgUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: _accentColor),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "$firstName $lastName",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(
                        "$function",
                        style: TextStyle(
                            fontSize: 16, color: _textFieldBackgroundColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5, left: 22, right: 22, bottom: 10),
                      child: Text(
                        "$aboutYou",
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
                    style: TextStyle(
                        fontSize: 16, color: _textFieldBackgroundColor),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Expanded(
                      child: Text(
                    "$email",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
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
                    style: TextStyle(
                        fontSize: 16, color: _textFieldBackgroundColor),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Expanded(
                    child: Text(
                      "$favMovie",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
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
                    style: TextStyle(
                        fontSize: 16, color: _textFieldBackgroundColor),
                  ),
                  SizedBox(
                    width: 42,
                  ),
                  Text(
                    "$tableNumber",
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
                    style: TextStyle(
                        fontSize: 16, color: _textFieldBackgroundColor),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "$visitorNumber",
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
      ),
    );
  }
}
