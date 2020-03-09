import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:junctionx_algiers/screens/home_page.dart';
import 'package:junctionx_algiers/screens/notification.dart';
import 'package:junctionx_algiers/screens/profile.dart';
import 'package:junctionx_algiers/screens/signup.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import '../util/state_widget.dart';
import '../util/auth.dart';
import '../util/validator.dart';
import 'widgets/loading.dart';

import 'event_schedule.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  bool _autoValidate = false;
  bool _loadingVisible = false;

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loadingVisible = !_loadingVisible;
    });
  }

  void _emailLogin(
      {String email, String password, BuildContext context}) async {
    if (_formKey.currentState.validate()) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        await _changeLoadingVisible();
        //need await so it has chance to go through error if found.
        await StateWidget.of(context).logInUser(email, password);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => homePage()),
        );
      } catch (e) {
        _changeLoadingVisible();
        print("Sign In Error: $e");
        String exception = Auth.getExceptionText(e);
        Flushbar(
          title: "Sign In Error",
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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: LoadingScreen(
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Scaffold(
            backgroundColor: _backgroundColor,
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(22, 57, 22, 0),
                      child: Text(
                        "Welcome to Celecom",
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
                        "Continue to sign in",
                        style:
                        TextStyle(letterSpacing: 2, color: _textFieldBackgroundColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(22, 37, 22, 0),
                      child: Theme(
                        data: new ThemeData(
                            primaryColor: _accentColor,
                            hintColor: Colors.white),
                        child: new TextFormField(
                          //controller: ndInput,
                            keyboardType: TextInputType.emailAddress,
                            controller: _email,
                            autofocus: false,
                            validator: Validator.validateEmail,
                            decoration: InputDecoration(
                                labelText: "Email address",
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
                          obscureText: true,
                            controller: _password,
                            validator: Validator.validatePassword,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Password",
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
                            _emailLogin(
                                email: _email.text, password: _password.text, context: context);
                           /* Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => homePage()),
                            );*/
                          },
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            new Text(
                              'New user? ',
                              style: new TextStyle(color: _textColor),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => signUpPage()),
                                );
                              },
                              child: new Text(
                                'Sign-up',
                                style: new TextStyle(color: Colors.blue),
                              ),
                            ),
                          ]
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
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ),
          inAsyncCall: _loadingVisible
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit the App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => SystemNavigator.pop(),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
}
