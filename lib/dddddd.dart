import 'package:flutter/foundation.dart' as foundation;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkable/linkable.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:uuid/uuid.dart';

class chat extends StatefulWidget {
  String? id;
  chat(this.id);

  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String groupId = Uuid().v1();

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> chatData = {
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
        'name':myname,
        "id":widget.id,


      };

      _message.clear();

      await _firestore
          .collection('groups')
          .add(chatData);
    }
  }

  void onSendMessag() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
        'name':myname,
        "id":widget.id,
      };

      _message.clear();
      await _firestore
          .collection('groups')
          .add(messages);
    } else {
      print("Enter Some Text");
    }
  }


@override
  void initState() {
    get12();// TODO: implement initState
    super.initState();
  }
  bool emojiShowing = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return
      ShowUpAnimation(
        curve: Curves.fastOutSlowIn,
        direction: Direction.horizontal,
        delayStart: Duration(milliseconds: 200),
    child:
      Padding(
      padding:EdgeInsets.only(top: 20),
      child: Scaffold(
        body:
        Column(
          children: [
            Material(
              elevation: 10,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  color: Color(0xff5F67EC),
                ),

                height: size.height / 17,
                width: size.width,
                child: Center(
                  child: Text('Team Chat',style: GoogleFonts.montserrat(
                    color:Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Material(
                elevation: 10,
                child: Container(
                  height: size.height / 1.40,
                  width: size.width,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('groups')
                        .orderBy('time')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          reverse: true,
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),

                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> chatMap =
                                  snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                                  return messageTile(size, chatMap,context,widget.id);
                                },
                              ),
                              Offstage(
                                offstage: !emojiShowing,
                                child: SizedBox(
                                    height: 250,
                                    child: EmojiPicker(
                                      textEditingController: _message,
                                      config: Config(
                                        columns:30,
                                        // Issue: https://github.com/flutter/flutter/issues/28894
                                        emojiSizeMax: 30*
                                            (foundation.defaultTargetPlatform ==
                                                TargetPlatform.iOS
                                                ? 1.30
                                                : 1.0),
                                        verticalSpacing: 0,
                                        horizontalSpacing: 0,
                                        gridPadding: EdgeInsets.zero,

                                        bgColor: const Color(0xFFF2F2F2),
                                        indicatorColor: Colors.blue,
                                        iconColor: Colors.grey,
                                        iconColorSelected: Colors.blue,
                                        backspaceColor: Colors.blue,
                                        skinToneDialogBgColor: Colors.white,
                                        skinToneIndicatorColor: Colors.grey,
                                        enableSkinTones: true,
                                        showRecentsTab: true,
                                        recentsLimit: 28,
                                        replaceEmojiOnLimitExceed: false,
                                        noRecents: const Text(
                                          'No Recents',
                                          style: TextStyle(fontSize: 20, color: Colors.black26),
                                          textAlign: TextAlign.center,
                                        ),
                                        loadingIndicator: const SizedBox.shrink(),
                                        tabIndicatorAnimDuration: kTabScrollDuration,
                                        categoryIcons: const CategoryIcons(),
                                        buttonMode: ButtonMode.MATERIAL,
                                        checkPlatformCompatibility: true,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),

            Material(
              elevation: 10,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                ),
                height: size.height / 11,
                width: size.width,
                alignment:

                Alignment.center,
                child: Container(
                  height: size.height / 12,
                  width: size.width / 1.1,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                      onPressed: () {
                setState(() {
                emojiShowing = !emojiShowing;
                });
                },
                  icon: const Icon(
                    Icons.emoji_emotions,
                      color:Color(0xff5F67EC)
                  ),
                ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:Color(0xffECEDFF),
                        ),

                        height: size.height / 17,
                        width: size.width / 1.5,
                        child: TextField(

                          controller: _message,
                          onEditingComplete: onSendMessage,

                          decoration: InputDecoration(
                              hintText: "type here",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.send,color:Color(0xff5F67EC)), onPressed: onSendMessage),
                    ],
                  ),
                ),

              ),
            ),
          ],

        ),

      ),
    ),
    );

  }

  String myname ="";
  String myid ="";
  get12() async {
    var doumet= await FirebaseFirestore.instance.collection("User").doc(widget.id).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      myname=val!["name1"];
      myid=val["username"];
    });
  }
}
Widget messageTile(Size size, Map<String, dynamic> chatMap,BuildContext context,docid)
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  showToast() {
    return  Fluttertoast.showToast(
        msg: 'Message Copied',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black
    );
  }
  return Builder(builder: (_) {

    if (chatMap['type'] == "text") {
      return
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Container(
          width: size.width,
          alignment: chatMap['id']==docid?
          Alignment.centerRight:Alignment.centerLeft,
          child:
          chatMap['id']==docid?
          Column(
            children: [
              Text(
                chatMap['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                    color:Color(0xffECEDFF),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15),topLeft: Radius.circular(15),),

                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Linkable(
                          text: chatMap['message'],
                          textColor:Color(0xff334D6E),
                          linkColor: Colors.purple,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        onLongPress: (){
                          Clipboard.setData(ClipboardData(text: chatMap['message']),

                          );
                          showToast();


                        },
                      ),
                    ],
                  )),
            ],
          )
              :
          Column(
            children: [
              Text(
                chatMap['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15),topRight: Radius.circular(15),),
                    color: Color(0xff5F67EC),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Linkable(
                          text: chatMap['message'],
                          textColor: Colors.white,
                          linkColor: Colors.purple,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        onLongPress: (){
                          Clipboard.setData(ClipboardData(text: chatMap['message']),

                          );
                          showToast();


                        },
                      ),
                    ],
                  )),
            ],
          )
      ),
        );
    }






     else {
      return SizedBox();
    }
  });
}

class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(

      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: InteractiveViewer(child: Image.network(imageUrl)),
      ),
    );
  }
}
