import 'package:flutter/material.dart';
import '../global.dart';

import 'mycircleavatar.dart';
class ReceivedMessagesWidget extends StatelessWidget {
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final String i;
  final String nom;
  final String imgUrl;
  const ReceivedMessagesWidget({
    Key key,
    @required this.i,
    @required this.nom,
    @required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                child: i!=""?Text(
                  "$i",
                  style: Theme.of(context).textTheme.body1.apply(
                        color: Colors.white,
                      ),
                ):Image.network(
                  imgUrl,
                  height: 150,
                  width: 200,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
