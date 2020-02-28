import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xff1c1e21),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
