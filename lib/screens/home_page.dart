import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junctionx_algiers/models/state.dart';
import 'package:junctionx_algiers/screens/chatScreen.dart';
import 'package:junctionx_algiers/screens/event_schedule.dart';
import 'package:junctionx_algiers/screens/notification.dart';
import 'package:junctionx_algiers/screens/profile.dart';
import 'package:junctionx_algiers/util/state_widget.dart';
import 'package:junctionx_algiers/util/validator.dart';
import 'global.dart';
import 'login.dart';
import 'widgets/widgets.dart';
import '../screens/widgets/full_image.dart';

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
  int hours = 0, minutes = 0, second = 0;
  StateModel appState;
  bool _loadingVisible = false;
  Timer _timer;
  int seconds;
  final databaseReference = Firestore.instance;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
// Get the current time
    var now = DateTime.now();
    // Get a 2-minute interval
    var twoHours = now.add(Duration(hours: 54)).difference(now);
    // Get the total number of seconds, 2 minutes for 120 seconds
    seconds = twoHours.inSeconds;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (mounted) {
        _scrollToBottom();
        timer.cancel();
      } else {
        timer.cancel();
      }
    });
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }

  void startTimer() {
    // Set 1 second callback
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      // Update interface
      setState(() {
        // minus one second because it calls back once a second
        seconds--;
      });
      if (seconds == 0) {
        // Countdown seconds 0, cancel timer
        cancelTimer();
      }
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  Future<void> onSendMessage(String content, int type, String groupChatId,
      String firstName, String lastName) async {
    // type: 0 = text, 1 = image, 2 = sticker
    if (content.trim() != '') {
      DocumentReference ref =
          await databaseReference.collection("messages").add({
        'id_user': groupChatId,
        'msg': content,
        'datetime': DateTime.now(),
        'nom': firstName + ' ' + lastName
      });
      _scrollToBottom();
      print(ref.documentID);

      //   listScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      // Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }

  Widget createCard(String notificationMsg, Timestamp notificationTime) {
    return Row(
      children: <Widget>[
        Container(
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
                        style: TextStyle(
                            color: widget._textFieldBackgroundColor,
                            fontSize: 10),
                      ),
                      Spacer(),
                      Text(
                        Validator.readTimestamp(notificationTime.seconds),
                        style: TextStyle(
                            color: widget._textFieldBackgroundColor,
                            fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$notificationMsg",
                        style: TextStyle(
                          color: widget._textColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _scrollToBottom() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
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
    int hours = seconds ~/ 3600;
    int minutes = seconds % 3600 ~/ 60;
    int second = seconds % 60;

    final userId = appState?.firebaseUserAuth?.uid ?? '';
    final email = appState?.firebaseUserAuth?.email ?? '';
    final lastName = appState?.user?.lastName ?? '';
    final firstName = appState?.user?.firstName ?? '';
    final table = appState?.user?.tableNumber ?? '';
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
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              size: 30,
              color: Colors.red,
            ),
            onPressed: () {
              StateWidget.of(context).logOutUser();
            },
          )
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
                          value: "$hours",
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                        LabelText(label: 'MIN', value: "$minutes"),
                        Text(
                          ":",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                        LabelText(label: 'SEC', value: "$second"),
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
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: Firestore.instance
                              .collection('notification')
                              .orderBy('time', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.documents.length,
                                  itemBuilder: (context, i) {
                                    return createCard(
                                        snapshot
                                            .data.documents[i].data['message'],
                                        snapshot
                                            .data.documents[i].data['time']);
                                  });
                            } else {
                              return new Center(
                                child: Text(
                                  snapshot.error,
                                  style: TextStyle(color: widget._textColor),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "HUB",
                  style: TextStyle(
                      color: widget._textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                            child: StreamBuilder<QuerySnapshot>(
                          stream: databaseReference
                              .collection('messages')
                              .orderBy('datetime', descending: false)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                controller: _controller,
                                padding: const EdgeInsets.all(15),
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (ctx, i) {
                                  if (snapshot.data.documents[i]
                                              .data['id_user'] !=
                                          userId &&
                                      snapshot.data.documents[i].data["msg"] !=
                                          "imgurl") {
                                    return SentMessageWidget(
                                      i: snapshot.data.documents[i].data["msg"],
                                      nom: snapshot
                                          .data.documents[i].data["nom"],
                                      imgUrl: "",
                                    );
                                  } else if (snapshot.data.documents[i]
                                              .data['id_user'] ==
                                          userId &&
                                      snapshot.data.documents[i].data["msg"] !=
                                          "imgurl") {
                                    return ReceivedMessagesWidget(
                                      i: snapshot.data.documents[i].data["msg"],
                                      imgUrl: "",
                                    );
                                  } else if (snapshot.data.documents[i]
                                              .data['id_user'] ==
                                          userId &&
                                      snapshot.data.documents[i]
                                              .data["imgUrl"] !=
                                          "") {
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FullScreenImage(snapshot
                                                          .data
                                                          .documents[i]
                                                          .data["imgUrl"])));
                                        },
                                        child: ReceivedMessagesWidget(
                                          i: "",
                                          imgUrl: snapshot
                                              .data.documents[i].data["imgUrl"],
                                        ));
                                  } else if (snapshot.data.documents[i]
                                              .data['id_user'] !=
                                          userId &&
                                      snapshot.data.documents[i]
                                              .data["imgUrl"] !=
                                          "") {
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FullScreenImage(snapshot
                                                          .data
                                                          .documents[i]
                                                          .data["imgUrl"])));
                                        },
                                        child: SentMessageWidget(
                                          i: "",
                                          imgUrl: snapshot
                                              .data.documents[i].data["imgUrl"],
                                        ));
                                  }
                                },
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        )),
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
        onPressed: () {
          onSendMessage(
              "Table $table need help", 0, userId, firstName, lastName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.grey[850],
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
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
          Text('$label',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
