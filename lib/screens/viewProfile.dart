import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'widgets/FirebaseMessageWrapper.dart';

class ViewProfile extends StatefulWidget {
  final userId;

  @override
  State<StatefulWidget> createState() => _ViewProfile();

  ViewProfile({
    Key key,
    @required this.userId,
  }) : super(key: key);
}

class _ViewProfile extends State<ViewProfile> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);

  String imgUrl = "";
  String firstName = "";
  String lastName = "";
  String function = "";
  String aboutYou = "";
  String email = "";
  String favMovie = "";
  String tableNumber = "";
  String visitorNumber = "";
  bool isVisitorNumberChanged = false;

  @override
  void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
  }

  void getUser() {
    Firestore.instance
        .collection('users')
        .document(widget.userId)
        .snapshots()
        .listen((data) {
      visitorNumber = data["visitorNumber"];
      setState(() {
        imgUrl = data["imgUrl"];
        lastName = data["lastName"];
        firstName = data["firstName"];
        function = data["function"];
        aboutYou = data["aboutYou"];
        email = data["email"];
        favMovie = data["favMovie"];
        tableNumber = data["tableNumber"];
      });
    });
  }

  void updateVisitorNumber() async{
    await Future.delayed(Duration(milliseconds: 100));
    if (!isVisitorNumberChanged) {
      Firestore.instance.collection('users').document(widget.userId).updateData({
        'visitorNumber' : "${int.parse(visitorNumber) +1}",
      }).catchError((e) {
        print(e);
      });
      print("done");
      isVisitorNumberChanged = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    updateVisitorNumber();
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
          ],
        ),
      ),
    );
  }
}
