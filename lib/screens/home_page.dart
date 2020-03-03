import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junctionx_algiers/models/state.dart';
import 'package:junctionx_algiers/screens/chatScreen.dart';
import 'package:junctionx_algiers/screens/event_schedule.dart';
import 'package:junctionx_algiers/screens/notification.dart';
import 'package:junctionx_algiers/screens/profile.dart';
import 'package:junctionx_algiers/util/state_widget.dart';
import 'global.dart';
import 'login.dart';
import 'widgets/widgets.dart';

class homePage extends StatefulWidget {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _cardColor = const Color(0xff1cf200);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = true;
  Timer timer;
  int currentTab = 0; // to
  StateModel appState;
  bool _loadingVisible = false;

  void handleTick() {
    if (this.mounted) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  Widget createCard() {
    return Container(
      width: 220,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.grey[850],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    "assets/img/junction.png",
                    width: 40,
                  ),
                  Text(
                    "JunctionX",
                    style: TextStyle(color: widget._textFieldBackgroundColor, fontSize: 10),
                  ),
                  Spacer(),
                  Text(
                    "10 min ago",
                    style: TextStyle(color: widget._textFieldBackgroundColor, fontSize: 10),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Text("Launch will be served in 20 min",
                      style:
                          TextStyle(color: widget._textColor, fontSize: 14))),
            ],
          ),
        ),
      ),
    );
  }

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
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);
    final userId = appState?.firebaseUserAuth?.uid ?? '';
    final email = appState?.firebaseUserAuth?.email ?? '';
    final firstName = appState?.user?.firstName ?? '';
    final lastName = appState?.user?.lastName ?? '';
    final settingsId = appState?.settings?.settingsId ?? '';

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Center(
          child: Image.asset('assets/img/junctionx_algiers_white_oneline.png',
              width: 200),
        ),
        backgroundColor: widget._backgroundColor,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app,size: 30,color: Colors.red,),onPressed: (){
            StateWidget.of(context).logOutUser();
          },)
        ],
        //iconTheme: IconThemeData(color: widget._accentColor),
      ),
      backgroundColor: widget._backgroundColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "TIME LEFT FOR SUBMISSION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: widget._accentColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 22, right: 22),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LabelText(
                          label: 'HRS',
                          value: hours.toString().padLeft(2, '0'),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                        LabelText(
                            label: 'MIN',
                            value: minutes.toString().padLeft(2, '0')),
                        Text(
                          ":",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                        LabelText(
                            label: 'SEC',
                            value: seconds.toString().padLeft(2, '0')),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "NOTIFICATIONS",
                  style: TextStyle(
                      color: widget._textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 110,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 22),),
                      createCard(),
                      SizedBox(width: 10),
                      createCard(),
                      SizedBox(width: 10),
                      createCard(),
                      Padding(padding: EdgeInsets.only(right: 22),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20),
                child: Text(
                  "HUB",
                  style: TextStyle(
                      color: widget._textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.grey[850],
                  child: Container(
                    height: 220,
                    //color: Colors.grey[850],
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(15),
                            itemCount: messages.length,
                            itemBuilder: (ctx, i) {
                              if (messages[i]['status'] ==
                                  MessageType.received) {
                                return ReceivedMessagesWidget(i: i);
                              } else {
                                return SentMessageWidget(i: i);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trai
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget._accentColor,
        child: Icon(
          Icons.info_outline,
          size: 30,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.grey[850],
        child: Container(
          width: MediaQuery.of(context).size.width-20,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 0;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventSchedulePage()));
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: currentTab == 0
                              ? widget._accentColor
                              : Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Schedule',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: currentTab == 1
                              ? widget._accentColor
                              : Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Hub',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 2;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationPage()));
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                          color: currentTab == 2
                              ? widget._accentColor
                              : Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 3;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: currentTab == 3
                              ? widget._accentColor
                              : Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Profie',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String label;
  final String value;
  final Color _accentColor = const Color(0xfff9a61b);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 5),
      //padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _accentColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
            Text(
              '$label',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
    );
  }
}
