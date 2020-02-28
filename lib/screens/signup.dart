import 'package:flutter/material.dart';

class signUpPage extends StatefulWidget {

  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);

  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget._backgroundColor,
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
                  child: new TextField(
                    //controller: ndInput,
                      keyboardType: TextInputType.number,
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
                  child: new TextField(
                    //controller: ndInput,
                      keyboardType: TextInputType.number,
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
                  child: new TextField(
                    //controller: ndInput,
                      keyboardType: TextInputType.number,
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
                  child: new TextField(
                    //controller: ndInput,
                      obscureText: true,
                      keyboardType: TextInputType.number,
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
                    onPressed: () {},
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
                      "assets/img/junctionX.png",
                      width: 150,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
