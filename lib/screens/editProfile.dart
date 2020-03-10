import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:junctionx_algiers/models/state.dart';
import 'package:junctionx_algiers/models/user.dart';
import 'package:junctionx_algiers/screens/home_page.dart';
import 'package:junctionx_algiers/screens/widgets/loading.dart';
import 'package:junctionx_algiers/util/auth.dart';
import 'package:junctionx_algiers/util/auth.dart';
import 'package:junctionx_algiers/util/auth.dart';
import 'package:junctionx_algiers/util/image_picker_handler.dart';
import 'package:junctionx_algiers/util/state_widget.dart';
import 'package:junctionx_algiers/util/validator.dart';
import 'package:path/path.dart' as Path;

import 'widgets/FirebaseMessageWrapper.dart';

class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _textColor = const Color(0xfff9fcfe);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstName;
  TextEditingController _lastName;

  TextEditingController _tableNumber;
  bool _autoValidate = false;
  StateModel appState;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    await Future.delayed(Duration(milliseconds: 100));
    appState = StateWidget.of(context).state;
    final firstName = appState?.user?.firstName ?? '';
    final lastName = appState?.user?.lastName ?? '';
    final tableNumber = appState?.user?.tableNumber ?? '';

    setState(() {
      _firstName = new TextEditingController(text: firstName);
      _lastName = new TextEditingController(text: lastName);
      _tableNumber = new TextEditingController(text: tableNumber);
    });
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
          Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(22, 17, 22, 0),
                      child: Text(
                        "Update your account",
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
                      child: Theme(
                        data: new ThemeData(
                            primaryColor: _accentColor,
                            hintColor: Colors.white),
                        child: new TextFormField(
                            autofocus: false,
                            textCapitalization: TextCapitalization.words,
                            controller: _firstName,
                            validator: Validator.validateName,
                            //controller: ndInput,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "First Name",
                                filled: true,
                                fillColor: _textFieldBackgroundColor,
                                border: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderRadius: BorderRadius.circular(5.0),
                                ))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(22, 7, 22, 0),
                      child: Theme(
                        data: new ThemeData(
                            primaryColor: _accentColor,
                            hintColor: Colors.white),
                        child: new TextFormField(
                            //controller: ndInput,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            textCapitalization: TextCapitalization.words,
                            controller: _lastName,
                            validator: Validator.validateName,
                            decoration: InputDecoration(
                                labelText: "Last Name",
                                filled: true,
                                fillColor: _textFieldBackgroundColor,
                                border: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderRadius: BorderRadius.circular(5.0),
                                ))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(22, 7, 22, 0),
                      child: Theme(
                        data: new ThemeData(
                            primaryColor: _accentColor,
                            hintColor: Colors.white),
                        child: new TextFormField(
                            //controller: ndInput,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your table number';
                              }
                              return null;
                            },
                            controller: _tableNumber,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Table number",
                                filled: true,
                                fillColor: _textFieldBackgroundColor,
                                border: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderRadius: BorderRadius.circular(5.0),
                                ))),
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
                            if (_formKey.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile2(
                                          firstName: _firstName.text,
                                          lastName: _lastName.text,
                                          tableNumber: _tableNumber.text,
                                        )),
                              );
                            } else {
                              setState(() => _autoValidate = true);
                            }
                          },
                          child: Text(
                            "NEXT",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class EditProfile2 extends StatefulWidget {
  final String firstName, lastName, tableNumber;

  EditProfile2({
    Key key,
    @required this.firstName,
    @required this.lastName,
    @required this.tableNumber,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditProfileState2();
}

class _EditProfileState2 extends State<EditProfile2> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _textColor = const Color(0xfff9fcfe);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _function;
  TextEditingController _favMovie;
  TextEditingController _aboutYou;
  bool _autoValidate = false;
  StateModel appState;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    await Future.delayed(Duration(milliseconds: 100));
    appState = StateWidget.of(context).state;
    final function = appState?.user?.function ?? '';
    final favMovie = appState?.user?.favMovie ?? '';
    final aboutYou = appState?.user?.aboutYou ?? '';

    setState(() {
      _function = new TextEditingController(text: function);
      _favMovie = new TextEditingController(text: favMovie);
      _aboutYou = new TextEditingController(text: aboutYou);
    });
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
          Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(22, 17, 22, 0),
                      child: Text(
                        "Update your account",
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
                      child: Theme(
                        data: new ThemeData(
                            primaryColor: _accentColor,
                            hintColor: Colors.white),
                        child: new TextFormField(
                            //controller: ndInput,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter function';
                              }
                              return null;
                            },
                            controller: _function,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Your function",
                                filled: true,
                                fillColor: _textFieldBackgroundColor,
                                border: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderRadius: BorderRadius.circular(5.0),
                                ))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(22, 7, 22, 0),
                      child: Theme(
                        data: new ThemeData(
                            primaryColor: _accentColor,
                            hintColor: Colors.white),
                        child: new TextFormField(
                            //controller: ndInput,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your favorite movie';
                              }
                              return null;
                            },
                            controller: _favMovie,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Fav Movie",
                                filled: true,
                                fillColor: _textFieldBackgroundColor,
                                border: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderRadius: BorderRadius.circular(5.0),
                                ))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(22, 7, 22, 0),
                      child: Theme(
                        data: new ThemeData(
                            primaryColor: _accentColor,
                            hintColor: Colors.white),
                        child: new TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please write something about you';
                              }
                              return null;
                            },
                            controller: _aboutYou,
                            //controller: ndInput,
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            maxLines: null,
                            decoration: InputDecoration(
                                labelText: "About you",
                                filled: true,
                                fillColor: _textFieldBackgroundColor,
                                border: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderRadius: BorderRadius.circular(5.0),
                                ))),
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
                            if (_formKey.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile3(
                                          firstName: widget.firstName,
                                          lastName: widget.lastName,
                                          tableNumber: widget.tableNumber,
                                          function: _function.text,
                                          favMovie: _favMovie.text,
                                          aboutYou: _aboutYou.text,
                                        )),
                              );
                            } else {
                              setState(() => _autoValidate = true);
                            }
                          },
                          child: Text(
                            "NEXT",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class EditProfile3 extends StatefulWidget {
  final String firstName, lastName, tableNumber, aboutYou, favMovie, function;

  EditProfile3({
    Key key,
    @required this.firstName,
    @required this.lastName,
    @required this.aboutYou,
    @required this.favMovie,
    @required this.function,
    @required this.tableNumber,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditProfileState3();
}

class _EditProfileState3 extends State<EditProfile3>
    with TickerProviderStateMixin, ImagePickerListener {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _textColor = const Color(0xfff9fcfe);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AnimationController _controller;
  ImagePickerHandler imagePicker;

  bool _loadingVisible = false;
  StateModel appState;
  var userId;

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loadingVisible = !_loadingVisible;
    });
  }

  File _image;
  String _uploadedFileURL;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    imagePicker = new ImagePickerHandler(this, _controller);
    imagePicker.init();
    init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future uploadFile() async {
    await _changeLoadingVisible();
    if (_image != null) {
      StorageReference storageReference = FirebaseStorage.instance
          .ref()
          .child('profileImages/${Path.basename(_image.path)}}');
      StorageUploadTask uploadTask = storageReference.putFile(_image);
      var dowUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      _uploadedFileURL = dowUrl.toString();
      print('File Uploaded');
    }
    _editingProfile(
      firstName: widget.firstName,
      lastName: widget.lastName,
      aboutYou: widget.aboutYou,
      favMovie: widget.favMovie,
      function: widget.function,
      tableNumber: widget.tableNumber,
      profileImg: _uploadedFileURL,
      context: context,
    );
  }

  void _editingProfile(
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
    Firestore.instance.collection('users').document(userId).updateData({
      'firstName': firstName,
      'lastName': lastName,
      'aboutYou': aboutYou,
      'favMovie': favMovie,
      'function': function,
      'tableNumber': tableNumber,
      'imgUrl': profileImg,
    }).catchError((e) {
      print(e);
    });

    Firestore.instance
        .collection('messages')
        .where('id_user', isEqualTo: userId)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              //print(doc.documentID);
              Firestore.instance.collection('messages').document(doc.documentID).updateData({
                'nom' : firstName + " " + lastName,
                'imgProfil' : profileImg,
              }).catchError((e) {
                print(e);
              });
            }));

    User user = await Auth.getUserLocal();
    user.firstName = firstName;
    user.lastName = lastName;
    user.aboutYou = aboutYou;
    user.favMovie = favMovie;
    user.function = function;
    user.tableNumber = tableNumber;
    user.imgUrl = profileImg;
    Auth.storeUserLocal(user);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => homePage()),
    );
  }

  Future init() async {
    await Future.delayed(Duration(milliseconds: 100));
    appState = StateWidget.of(context).state;
    userId = appState?.user?.userId ?? '';
    //print(userId);
    setState(() {
      _uploadedFileURL = appState?.user?.imgUrl ?? '';
      //print(_uploadedFileURL);
    });
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
              Center(
                child: IconButton(
                  padding: EdgeInsets.all(35),
                  iconSize: 150,
                  color: _textFieldBackgroundColor,
                  icon: _image != null
                      ? Image.file(_image)
                      : CachedNetworkImage(
                          imageUrl: _uploadedFileURL,
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
                  onPressed: () {
                    //chooseFile();
                    imagePicker.showDialog(context);
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

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
}
