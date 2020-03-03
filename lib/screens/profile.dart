import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junctionx_algiers/models/state.dart';
import 'package:junctionx_algiers/util/state_widget.dart';

import 'login.dart';

class ProfilePage extends StatelessWidget {
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
    final userId = appState?.firebaseUserAuth?.uid ?? '';
    final email = appState?.firebaseUserAuth?.email ?? '';
    final firstName = appState?.user?.firstName ?? '';
    final lastName = appState?.user?.lastName ?? '';
    final tableNumber = appState?.user?.tableNumber ?? '';
    final function = appState?.user?.function ?? '';
    final favmovie= appState?.user?.favMovie ??'';
    final visitorNumber=appState?.user?.visitorNumber??'';
    final aboutYou=appState?.user?.aboutYou??'';
    final imgUrl=appState?.user?.imgUrl??'';
    final settingsId = appState?.settings?.settingsId ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/junctionx_algiers_white_oneline.png',
            width: 200),
        backgroundColor: _backgroundColor,
        iconTheme: IconThemeData(color: _accentColor),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app,size: 30,color: Colors.red,),onPressed: (){
            StateWidget.of(context).logOutUser();
          },)
        ],
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
                                    "$imgUrl")))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "$firstName $lastName",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "$function",
                      style: TextStyle(
                          fontSize: 16, color: _textFieldBackgroundColor),
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
                  style:
                      TextStyle(fontSize: 16, color: _textFieldBackgroundColor),
                ),
                Spacer(),
                Text(
                  "$email",
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
                  "$favmovie",
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
                  style:
                      TextStyle(fontSize: 16, color: _textFieldBackgroundColor),
                ),
                Spacer(),
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
    );
  }
}
