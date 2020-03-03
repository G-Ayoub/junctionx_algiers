import 'package:flutter/material.dart';
import 'package:junctionx_algiers/screens/signup_2.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import '../models/user.dart';
import '../util/auth.dart';
import '../util/validator.dart';
import 'widgets/loading.dart';

class signUpPage extends StatefulWidget {

  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);


  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = new TextEditingController();
  final TextEditingController _lastName = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  bool _autoValidate = false;
  bool _loadingVisible = false;

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
     /*   await Auth.signUp(email, password).then((uID) {
          Auth.addUserSettingsDB(new User(
            userId: uID,
            email: email,
            firstName: firstName,
            lastName: lastName,
          ));
        });*/
        //now automatically login user too
        //await StateWidget.of(context).logInUser(email, password);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => signup2Page(email,password,firstName,lastName)),
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
      backgroundColor: widget._backgroundColor,
      body: LoadingScreen(
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: SingleChildScrollView(
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
                          color: widget._textColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(22, 17, 22, 0),
                    child: Text(
                      "Why don’t you tell us a thing or two about you ",
                      style:
                      TextStyle(letterSpacing: 2, color: widget._textFieldBackgroundColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(22, 17, 22, 0),
                    child: Theme(
                      data: new ThemeData(
                          primaryColor: widget._accentColor,
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
                              fillColor: widget._textFieldBackgroundColor,
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
                          primaryColor: widget._accentColor,
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
                              fillColor: widget._textFieldBackgroundColor,
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
                          primaryColor: widget._accentColor,
                          hintColor: Colors.white),
                      child: new TextFormField(
                        //controller: ndInput,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          controller: _email,
                          validator: Validator.validateEmail,
                          decoration: InputDecoration(
                              labelText: "Email Address",
                              filled: true,
                              fillColor: widget._textFieldBackgroundColor,
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
                          primaryColor: widget._accentColor,
                          hintColor: Colors.white),
                      child: new TextFormField(
                        //controller: ndInput,
                          autofocus: false,
                          obscureText: true,
                          controller: _password,
                          validator: Validator.validatePassword,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Password",
                              filled: true,
                              fillColor: widget._textFieldBackgroundColor,
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
                        color: widget._accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                        onPressed: () {
                          _emailSignUp(
                              firstName: _firstName.text,
                              lastName: _lastName.text,
                              email: _email.text,
                              password: _password.text,
                              context: context);
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signup2Page()),
                          );*/
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
            ),
          ),
        ),
          inAsyncCall: _loadingVisible
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
