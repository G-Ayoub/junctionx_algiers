import 'package:flutter/material.dart';
import '../global.dart';
import 'mycircleavatar.dart';

class SentMessageWidget extends StatelessWidget {
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final String i;
  final String nom;
  final String imgUrl;
  final String imgProfil;
  final int help;

  const SentMessageWidget({
    Key key,
    this.i,
    this.nom,
    this.imgUrl,
    this.imgProfil,
    this.help,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
<<<<<<< Updated upstream
          MyCircleAvatar(
            imgUrl: imgProfil,
=======

          MyCircleAvatar(
            imgUrl: "https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png",
>>>>>>> Stashed changes
          ),
          SizedBox(width: 5,),
          Column(
            children: <Widget>[
              Text(
                "$nom",
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
              ),

              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: help==1?_accentColor:_textFieldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child:i!=""? Text(
                  "$i",
                  style: Theme.of(context).textTheme.body2.apply(
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
