import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junctionx_algiers/screens/chatScreen.dart';
import 'package:junctionx_algiers/screens/event_schedule.dart';
import 'package:junctionx_algiers/screens/notification.dart';
import 'package:junctionx_algiers/screens/profile.dart';
import 'global.dart';
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


  void handleTick() {
    if (isActive) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    "assets/img/junction.png",
                    width: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "JunctionX",
                    style: TextStyle(color: widget._textColor, fontSize: 10),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "10 min ago",
                    style: TextStyle(color: widget._textColor, fontSize: 10),
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
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return Scaffold(
      appBar:AppBar(
        backgroundColor: widget._backgroundColor,
        iconTheme: IconThemeData(color: Colors.black54),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/img/junctionx_algiers.png",
                  width: 250,
                ),
              ],
            )
          ],
        ),
        actions: <Widget>[

        ],
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
              Center(
                child: Text(
                  "TIME LEFT FOR SUBMISSION",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: widget._accentColor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LabelText(
                          label: 'HRS',
                          value: hours.toString().padLeft(2, '0')),
                      Text(
                        ":",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                      LabelText(
                          label: 'MIN',
                          value: minutes.toString().padLeft(2, '0')),
                      Text(
                        ":",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                      LabelText(
                          label: 'SEC',
                          value: seconds.toString().padLeft(2, '0')),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "NOTIFICATIONS",
                  style: TextStyle(
                      color: widget._textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 110,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      createCard(),
                      SizedBox(width: 10),
                      createCard(),
                      SizedBox(width: 10),
                      createCard(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "HUB",
                  style: TextStyle(
                      color: widget._textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 20),
                child: Container(
                  height: 220,
                  color: Colors.grey[850],
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(15),
                                itemCount: messages.length,
                                itemBuilder: (ctx, i) {
                                  if (messages[i]['status'] == MessageType.received) {
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

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // This trai
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget._accentColor,
        child: Icon(Icons.info_outline,size: 30,),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.grey[850],
        child: Container(
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
                            MaterialPageRoute(builder: (context) => EventSchedulePage())
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: currentTab == 0 ? widget._accentColor : Colors.grey,
                        ),
                        SizedBox(height: 5,),
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
                            MaterialPageRoute(builder: (context) => ChatScreen())
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: currentTab == 1 ? widget._accentColor : Colors.grey,
                        ),
                        SizedBox(height: 5,),
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
                            MaterialPageRoute(builder: (context) => NotificationPage())
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                          color: currentTab == 2 ? widget._accentColor : Colors.grey,
                        ),
                        SizedBox(height: 5,),
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
                            MaterialPageRoute(builder: (context) =>ProfilePage())
                        );
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: currentTab == 3 ? widget._accentColor: Colors.grey,
                        ),
                        SizedBox(height: 5,),
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
      width: 100,
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _accentColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 46, fontWeight: FontWeight.bold),
          ),
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
