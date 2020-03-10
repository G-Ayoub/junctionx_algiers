import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../global.dart';

import 'mycircleavatar.dart';
class ReceivedMessagesWidget extends StatelessWidget {
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _accentColor = const Color(0xfff9a61b);
  final String i;
  //final String nom;
  final String imgUrl;
  final int help;
  const ReceivedMessagesWidget({
    Key key,
    @required this.i,
    //@required this.nom,
    @required this.imgUrl,
    @required this.help,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: help==1?_accentColor:Colors.grey[50],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: i!=""?Text(
                  "$i",
                  style: Theme.of(context).textTheme.body1.apply(
                        color: help==1?Colors.white:Colors.black,
                      ),
                ):CachedNetworkImage(
                  imageUrl: imgUrl,
                  placeholder: (context, url) => new CircularProgressIndicator(),
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
