import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junctionx_algiers/models/user.dart';
import 'package:junctionx_algiers/screens/signup_3.dart';
import 'package:junctionx_algiers/screens/widgets/loading.dart';
import 'package:junctionx_algiers/util/auth.dart';

class signup2Page extends StatefulWidget {
  String email,password,firstName,lastName;
  signup2Page(this.email,this.password,this.firstName,this.lastName);

  @override
  _signup2PageState createState() => _signup2PageState(this.email,this.password,this.firstName,this.lastName);
}

class _signup2PageState extends State<signup2Page> {
  String email,password,firstName,lastName;
  final Color _backgroundColor = const Color(0xff1c1e21);

  final Color _textColor = const Color(0xfff9fcfe);

  final Color _accentColor = const Color(0xfff9a61b);

  final Color _textFieldBackgroundColor = const Color(0xff797979);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _tableNumber = new TextEditingController();

  final TextEditingController _function = new TextEditingController();

  final TextEditingController _favMovie = new TextEditingController();

  final TextEditingController _aboutYou = new TextEditingController();

  bool _autoValidate = false;

  bool _loadingVisible = false;

  _signup2PageState(this.email,this.password,this.firstName,this.lastName);

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loadingVisible = !_loadingVisible;
    });
  }

  void _emailSignUp(
      {String firstName,
        String lastName,
        String email,
        String password,
        BuildContext context}) async {
    if (_formKey.currentState.validate()) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        await _changeLoadingVisible();
        //need await so it has chance to go through error if found.
           await Auth.signUp(email, password).then((uID) {
          Auth.addUserSettingsDB(new User(
            userId: uID,
            email: email,
            firstName: firstName,
            lastName: lastName,
            aboutYou: _aboutYou.text,
            favMovie: _favMovie.text,
            function: _function.text,
            tableNumber: _tableNumber.text,
            imgUrl: "https://cdn.icon-icons.com/icons2/1769/PNG/512/4092564-about-mobile-ui-profile-ui-user-website_114033.png",
            visitorNumber: "1",
          ));
        });
        //now automatically login user too
        //await StateWidget.of(context).logInUser(email, password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => signup3Page()),
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
    } else {
      setState(() => _autoValidate = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: LoadingScreen(
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
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
                    "Few steps to go",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: _textColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(22, 37, 22, 0),
                  child: Theme(
                    data: new ThemeData(
                        primaryColor: _accentColor, hintColor: Colors.white),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(22, 7, 22, 0),
                  child: Theme(
                    data: new ThemeData(
                        primaryColor: _accentColor, hintColor: Colors.white),
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
                        primaryColor: _accentColor, hintColor: Colors.white),
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
                        primaryColor: _accentColor, hintColor: Colors.white),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signup3Page(
                            email: this.email,
                            firstName: this.firstName,
                            lastName: this.lastName,
                            password: this.password,
                            aboutYou: _aboutYou.text,
                            favMovie: _favMovie.text,
                            function: _function.text,
                            tableNumber: _tableNumber.text,
                          )),
                        );
                      },
                      child: Text(
                        "NEXT",
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
          inAsyncCall: _loadingVisible
      ),
    );
  }
}
