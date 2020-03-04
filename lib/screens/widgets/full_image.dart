import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  String imgUrl;
  FullScreenImage(this.imgUrl);
  @override
  Widget build(BuildContext context) {
    //you do not need container here, STACK will do just fine if you'd like to
    //simplify it more
    return Padding(
      padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
      child: Container(
        child: Stack(children: <Widget>[
          //in the stack, the background is first. using fit:BoxFit.cover will cover
          //the parent container. Use double.infinity for height and width
          FadeInImage(
            placeholder: NetworkImage(imgUrl),
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            //if you use a larger image, you can set where in the image you like most
            //width alignment.centerRight, bottomCenter, topRight, etc...
            alignment: Alignment.center,
          ),
        ]),
      ),
    );
  }
}
