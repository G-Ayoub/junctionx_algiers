import 'package:flutter/material.dart';
import '../global.dart';

import 'mycircleavatar.dart';
class ReceivedMessagesWidget extends StatelessWidget {
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final int i;
  const ReceivedMessagesWidget({
    Key key,
    @required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: <Widget>[
          MyCircleAvatar(
            imgUrl: messages[i]['contactImgUrl'],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${messages[i]['contactName']}",
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: _textFieldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  "${messages[i]['message']}",
                  style: Theme.of(context).textTheme.body1.apply(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
       /*   SizedBox(width: 15),
          Text(
            "${messages[i]['time']}",
            style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
          ),*/
        ],
      ),
    );
  }
}
