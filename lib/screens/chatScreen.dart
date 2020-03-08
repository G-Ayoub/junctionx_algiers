import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:junctionx_algiers/models/state.dart';
import 'package:junctionx_algiers/screens/widgets/full_image.dart';
import 'global.dart';
import 'login.dart';
import 'widgets/widgets.dart';
import '../util/state_widget.dart';
import 'package:path/path.dart' as Path;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _accentColor = const Color(0xfff9a61b);
}

class _ChatScreenState extends State<ChatScreen> {

  var _sendMsg = TextEditingController();
  StateModel appState;
  bool _loadingVisible = false;
  final databaseReference = Firestore.instance;
  ScrollController _controller = ScrollController();

  File _image;
  String _uploadedFileURL;

  Future chooseFile(String userId,String firstName,String lastName,String imgU) async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
        uploadFile(userId,firstName,lastName,imgU);
      });
    });
  }

  Future uploadFile(String userId,String firstName,String lastName,String imgU) async {
    String url;
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    var dowUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    _uploadedFileURL = dowUrl.toString();
    print(_uploadedFileURL);
    onSendMessage("imgurl",0,userId,firstName,lastName,_uploadedFileURL,imgU);
    print('File Uploaded');
  }




  Future<void> onSendMessage(String content, int type,String groupChatId,String firstName,String lastName,String imageUrl,String imgProfil) async {
    // type: 0 = text, 1 = image, 2 = sticker
    if (content.trim() != '') {
      _sendMsg.clear();
      DocumentReference ref = await databaseReference.collection("messages")
          .add({
        'id_user': groupChatId,
        'msg':content,
        'datetime':DateTime.now(),
        'nom':firstName+' '+lastName,
        'imgUrl':imageUrl,
        'imgProfil':imgProfil,
        'help':0,
      });


   //   listScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
     // Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }

  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (mounted) {
        timer.cancel();
      } else {
        timer.cancel();
      }
    });
    super.initState();
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
    final userId = appState?.firebaseUserAuth?.uid ?? '';
    final firstName = appState?.user?.firstName ?? '';
    final lastName = appState?.user?.lastName ?? '';
    final imgU = appState?.user?.imgUrl ??'';

    return Scaffold(
      backgroundColor: widget._backgroundColor,
      appBar: AppBar(
        title: Image.asset('assets/img/junctionx_algiers_white_oneline.png',
            width: 200),
        backgroundColor: widget._backgroundColor,
        iconTheme: IconThemeData(color: widget._accentColor),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app,size: 30,color: Colors.red,),onPressed: (){
            StateWidget.of(context).logOutUser();
          },)
        ],
      ),
        
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: databaseReference
                        .collection('messages')
                        .orderBy('datetime',descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Timer(Duration(milliseconds: 1000), () => _controller.jumpTo(_controller.position.maxScrollExtent+100000));
                        return ListView.builder(
                          controller: _controller,
                          reverse: true,
                          padding: const EdgeInsets.all(15),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (ctx, i) {
                            if (snapshot.data.documents[i].data['id_user'] != userId && snapshot.data.documents[i].data["msg"]!="imgurl") {
                              return SentMessageWidget(i: snapshot.data.documents[i].data["msg"],nom:  snapshot.data.documents[i].data["nom"],imgUrl: "",imgProfil: snapshot.data.documents[i].data["imgProfil"],help:  snapshot.data.documents[i].data["help"],);
                            } else if(snapshot.data.documents[i].data['id_user'] == userId && snapshot.data.documents[i].data["msg"]!="imgurl") {
                              return ReceivedMessagesWidget(i: snapshot.data.documents[i].data["msg"],imgUrl: "",help:  snapshot.data.documents[i].data["help"],);
                            }else if(snapshot.data.documents[i].data['id_user'] == userId && snapshot.data.documents[i].data["imgUrl"]!="") {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FullScreenImage(snapshot.data.documents[i].data["imgUrl"])));
                                },
                                child:ReceivedMessagesWidget(i: "",imgUrl: snapshot.data.documents[i].data["imgUrl"],help:  snapshot.data.documents[i].data["help"],));
                            }else if (snapshot.data.documents[i].data['id_user'] != userId && snapshot.data.documents[i].data["imgUrl"]!="") {
                              return InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FullScreenImage(snapshot.data.documents[i].data["imgUrl"])));
                                  },
                                  child:SentMessageWidget(i: "",imgUrl: snapshot.data.documents[i].data["imgUrl"],nom:  snapshot.data.documents[i].data["nom"],imgProfil: snapshot.data.documents[i].data["imgProfil"],help:  snapshot.data.documents[i].data["help"],

                              ));
                            }
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  )
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  height: 61,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: widget._textFieldBackgroundColor,
                            shape: BoxShape.circle),
                        child: GestureDetector(
                          child: Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              chooseFile(userId,firstName,lastName,imgU);
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: widget._textFieldBackgroundColor,
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              controller: _sendMsg,
                              decoration: InputDecoration(
                                hintText: "Type Something...",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: widget._textFieldBackgroundColor,
                            shape: BoxShape.circle),
                        child: InkWell(
                          child: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          onTap: (){
                            if(_sendMsg.text!=""){
                              onSendMessage(_sendMsg.text,0,userId,firstName,lastName,"",imgU);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
       /*   Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _showBottom = false;
                  onSendMessage(_sendMsg.text,0,userId,firstName,lastName);
                });
              },
            ),
          ),*/

        ],
      ),
    );
  }


}

List<IconData> icons = [
  Icons.image,
  Icons.camera_alt,
];
