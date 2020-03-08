import 'package:flutter/material.dart';
import 'package:junctionx_algiers/util/MessageSteam.dart';

class FirebaseMessageWrapper extends StatefulWidget {
  final Widget child;

  FirebaseMessageWrapper(this.child);

  @override
  _FirebaseMessageWrapperState createState() => _FirebaseMessageWrapperState();
}

class _FirebaseMessageWrapperState extends State<FirebaseMessageWrapper> {
  MessageStream _messageStream = MessageStream.instance;
  final Color _accentColor = const Color(0xfff9a61b);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: null,
        stream: _messageStream.messageStream,
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          Map<String, dynamic> msg = snapshot.data;
          if (msg != null) {
            // check if this instance is the current route or else message will be displayed on all instances
            if (ModalRoute.of(context).isCurrent) {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => _showMessage(msg));
            }
            // adding a null stops the previous message from being displayed again
            MessageStream.instance.addMessage(null);
          }
          return widget.child;
        });
  }

  void _showMessage(Map<String, dynamic> message) {
    SnackBar bar = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 20),
      action: SnackBarAction(
        label: "Close",
        textColor: _accentColor,
        onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
      ),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message['notification']["title"],
              style: TextStyle(fontSize: 20),
            ),
            Text(message['notification']["body"]),
          ],
        ),
      ),
    );

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(bar);
  }
}
