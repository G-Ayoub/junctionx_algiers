import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:junctionx_algiers/models/user.dart';
import 'package:junctionx_algiers/screens/widgets/loading.dart';
import 'package:junctionx_algiers/util/auth.dart';
import 'package:path/path.dart' as Path;

import 'login.dart';

class signup3Page extends StatefulWidget {
  String email,
      password,
      firstName,
      lastName,
      aboutYou,
      favMovie,
      function,
      tableNumber;

  signup3Page({
    Key key,
    @required this.email,
    @required this.password,
    @required this.firstName,
    @required this.lastName,
    @required this.aboutYou,
    @required this.favMovie,
    @required this.function,
    @required this.tableNumber,
  }) : super(key: key);

  @override
  _signup3PageState createState() => _signup3PageState();
}

class _signup3PageState extends State<signup3Page> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _loadingVisible = false;

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loadingVisible = !_loadingVisible;
    });
  }

  File _image;
  String _uploadedFileURL;

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile() async {
    await _changeLoadingVisible();
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('profileImages/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    var dowUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    _uploadedFileURL = dowUrl.toString();
    print('File Uploaded');
    _emailSignUp(
      firstName: widget.firstName,
      lastName: widget.lastName,
      email: widget.email,
      aboutYou: widget.aboutYou,
      favMovie: widget.favMovie,
      function: widget.function,
      password: widget.password,
      tableNumber: widget.tableNumber,
      profileImg: _uploadedFileURL,
      context: context,
    );
  }

  void _emailSignUp(
      {String firstName,
      String lastName,
      String email,
      String password,
      String aboutYou,
      String favMovie,
      String function,
      String tableNumber,
      String profileImg,
      BuildContext context}) async {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      //need await so it has chance to go through error if found.
      await Auth.signUp(email, password).then((uID) {
        Auth.addUserSettingsDB(new User(
          userId: uID,
          email: email,
          firstName: firstName,
          lastName: lastName,
          aboutYou: aboutYou,
          favMovie: favMovie,
          function: function,
          tableNumber: tableNumber,
          imgUrl: profileImg,
          visitorNumber: "1",
        ));
      });
      //now automatically login user too
      //await StateWidget.of(context).logInUser(email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginPage()),
      );
    } catch (e) {
      _changeLoadingVisible();
      print("Sign Up Error: $e");
      String exception = Auth.getExceptionText(e);
      Flushbar(
        title: "Sign Up Error",
        message: exception,
        duration: Duration(seconds: 5),
      )..show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: LoadingScreen(
        key: _formKey,
        inAsyncCall: _loadingVisible,
        child: SingleChildScrollView(
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
                  "Almost Done !",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: _textColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(22, 17, 22, 0),
                child: Text(
                  "Now choose a profile picture, tap on tha camera icon",
                  style: TextStyle(
                      letterSpacing: 2, color: _textFieldBackgroundColor),
                ),
              ),
              Center(
                child: IconButton(
                  padding: EdgeInsets.all(35),
                  iconSize: 150,
                  color: _textFieldBackgroundColor,
                  icon: _image != null
                      ? Image.file(_image)
                      : Icon(Icons.account_circle),
                  onPressed: () {
                    chooseFile();
                  },
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
                      uploadFile();
                    },
                    child: Text(
                      "DONE",
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
      ),
    );
  }
}
