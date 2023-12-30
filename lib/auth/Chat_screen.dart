//import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
//import 'package:record/record.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:permission_handler/permission_handler.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:url_launcher/url_launcher.dart';
//import '../classes/sound_recorder.dart';
//import 'package:record/record.dart';
import 'package:weddingplanner/auth/voicechat.dart';

class Chat_screen extends StatefulWidget {
  Chat_screen({super.key});

  @override
  State<Chat_screen> createState() => _Chat_screenState();
}

late SharedPreferences prefs;
final _auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;
SoundRecorder recorder = SoundRecorder();
String? messegetext; //من هون بنوخد المسج
User? signinuser; //من هون بنوخد الايميل
File? imagefile;
List? searchmsgall = [];
List? searchmsg = [];
String? _text;
String img = '';
String? imageUrl;
String? msg;
bool isPlaying = false;
final AudioPlayer audioPlayer = AudioPlayer();

class _Chat_screenState extends State<Chat_screen> {
  final textmessegescontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    getcurrentuser();
    recorder.init();
  }

  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  search(shopgetresult) {
    if (shopgetresult!.length == 0) {
      setState(() {
        searchmsg = [];
      });
      //
    } else {
      for (var msg in searchmsgall!) {
        if (msg[0].toString().toLowerCase().contains(shopgetresult!)) {
          print(msg.toString());

          searchmsg!.add(msg);
        }
      }
    }
  }

  void getcurrentuser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signinuser = user;
        print(signinuser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 85, 60, 78),
          title: Row(children: [
            Image.asset(
              "images/chat.png",
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Room ",
              //ignore: unnecessary_const
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 25,
            ),
            Center(
                child: Container(
              width: 120,
              child: TextField(
                onChanged: (value) {
                  msg = value.toString();
                },
                //ignore: prefer_const_constructors
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          setState(() {
                            searchmsg!.length = 0;
                            searchmsg = [];
                          });

                          search(msg);
                          // ignore: use_build_context_synchronously
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('${msg} feedback'),
                                  content: setupAlertDialoadContainer(),
                                );
                              });

                          // Navigator.of(context).pushNamed("getmsg");
                        }),

                    // ignore: prefer_const_constructors
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    hintText: "Write Shope Name here...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              ),
            ))
          ]),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("joinus");
                },
                icon: const Icon(Icons.close, color: Colors.white)),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MeesageStreamwidget(),
              Container(
                decoration: BoxDecoration(
                    border: const Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 85, 60, 78), width: 2))),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textmessegescontroller,
                          onChanged: (value) {
                            messegetext = value;
                          },
                          //ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: const Icon(Icons.photo),
                                  onPressed: () async {
                                    bool kisweb;
                                    try {
                                      if (Platform.isAndroid ||
                                          Platform.isIOS) {
                                        kisweb = false;
                                      } else {
                                        kisweb = true;
                                      }
                                    } catch (e) {
                                      kisweb = true;
                                    }
                                    final firebaseStorage =
                                        FirebaseStorage.instance;
                                    final picker = ImagePicker();
                                    XFile? image;

                                    image = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    var file = File(image!.path);

                                    var snapshot = await firebaseStorage
                                        .ref()
                                        .child('images')
                                        .putFile(file);

                                    var downloadUrl =
                                        await snapshot.ref.getDownloadURL();

                                    imageUrl = downloadUrl;
                                    firestore.collection('messeges').add({
                                      'image': imageUrl,
                                      'sender': signinuser!.email,
                                      'text': '',
                                      'time': FieldValue.serverTimestamp(),
                                      'audio': '',
                                      'type': 'img'
                                    });
                                  }),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              hintText: "Write your message here...",
                              border: InputBorder.none),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            //  type = "text";
                            textmessegescontroller.clear();

                            firestore.collection('messeges').add({
                              'text': messegetext,
                              'sender': signinuser!.email,
                              'image': '',
                              'time': FieldValue.serverTimestamp(),
                              'audio': '',
                              'type': 'text'
                            });
                          },
                          child: Text("Send",
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18))),
                      IconButton(
                        icon:
                            Icon(recorder.isRecording ? Icons.send : Icons.mic),
                        onPressed: () async {
                          var data;
                          print('value before setstate ' +
                              recorder.isRecording.toString());
                          if (recorder.isRecording == false) {
                            recorder.startRecord();
                            print('recording is started');
                            recorder.isRecording = true;
                          } else {
                            recorder.stopRecord();

                            print('recording is stopped');

                            recorder.isRecording = false;
                          }
                          data = recorder.path;
                          if (data != null) {
                            firestore.collection('messeges').add({
                              'text': '',
                              'sender': signinuser!.email,
                              'image': '',
                              'time': FieldValue.serverTimestamp(),
                              'audio': data,
                              'type': 'audio'
                            });
                          }

                          setState(() {});
                        },
                      )
                    ]),
              )
            ],
          ),
        ));
  }

  Widget setupAlertDialoadContainer() {
    final currentuser = signinuser!.email;

    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement

      child: ListView.builder(
        shrinkWrap: true,
        itemCount: searchmsg!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: currentuser == searchmsg![index][1]
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  '${searchmsg![index][1]}',
                  style: const TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 42, 8, 48)),
                ),
                Material(
                    elevation: 5,
                    borderRadius: currentuser == searchmsg![index][1]
                        // ignore: prefer_const_constructors
                        ? BorderRadius.only(
                            topLeft: const Radius.circular(30),
                            bottomLeft: const Radius.circular(30),
                            bottomRight: const Radius.circular(30))
                        : const BorderRadius.only(
                            topRight: const Radius.circular(30),
                            bottomLeft: const Radius.circular(30),
                            bottomRight: const Radius.circular(30)),
                    color: currentuser == searchmsg![index][1]
                        ? Colors.purple[800]
                        : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text('${searchmsg![index][0]}',
                          style: TextStyle(
                              // color: currentuser == searchmsg![index][1]
                              //     ? Colors.white
                              //     : Colors.purple,
                              )),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MeesageStreamwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: firestore.collection('messeges').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        searchmsgall = [];
        List<MessageLine> messageWidgets = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }
        final messages = snapshot.data!.docs;
        for (var message in messages) {
          final messagetext1 = message.get('text');
          final messagesender = message.get('sender');
          final Type = message.get('type');
          final image = message.get('image');
          final audio = message.get('audio');
          final currentuser = signinuser!.email;
          searchmsgall!.add([messagetext1, messagesender]);
          final messagewidget = MessageLine(
            Sender: messagesender,
            text: messagetext1,
            isMe: currentuser == messagesender,
            Type: Type,
            imgurl: image,
            audio: audio,
          );

          messageWidgets.add(messagewidget);
        }
        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class MessageLine extends StatefulWidget {
  const MessageLine(
      {this.text,
      this.Sender,
      required this.isMe,
      this.Type,
      this.imgurl,
      required this.audio,
      super.key});
  final String? text;
  final String? Sender;
  final bool isMe;
  final String? Type;
  final String? imgurl;
  final String? audio;

  @override
  State<MessageLine> createState() => _MessageLineState();
}

class _MessageLineState extends State<MessageLine> {
  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context) {
    return widget.Type == "text"
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: widget.isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.Sender}',
                  style: const TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 42, 8, 48)),
                ),
                Material(
                    elevation: 5,
                    borderRadius: widget.isMe
                        // ignore: prefer_const_constructors
                        ? BorderRadius.only(
                            topLeft: const Radius.circular(30),
                            bottomLeft: const Radius.circular(30),
                            bottomRight: const Radius.circular(30))
                        : const BorderRadius.only(
                            topRight: const Radius.circular(30),
                            bottomLeft: const Radius.circular(30),
                            bottomRight: const Radius.circular(30)),
                    color: widget.isMe ? Colors.purple[800] : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        '${widget.text}',
                        style: TextStyle(
                            fontSize: 15,
                            color: widget.isMe ? Colors.white : Colors.purple),
                      ),
                    )),
              ],
            ),
          )
        : widget.Type == 'img'
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: widget.isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.Sender}',
                        style: const TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 42, 8, 48)),
                      ),
                      Container(
                          height: 100,
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          alignment: widget.isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => showImage(
                                    imageUrl: '${widget.imgurl}',
                                  ),
                                ),
                              );
                            },
                            child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(border: Border.all()),
                                alignment: '${widget.imgurl}' != ""
                                    ? null
                                    : Alignment.center,
                                child: '${widget.imgurl}' != ""
                                    ? Image.network('${widget.imgurl}',
                                        fit: BoxFit.cover)
                                    : const CircularProgressIndicator()),
                          ))
                    ]))
            : widget.Type == 'audio'
                ? Container(
                    color: const Color.fromARGB(255, 255, 7, 243),
                    height: 30,
                    width: 400,
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 90,
                        ),
                        GestureDetector(
                            onTap: () {
                              if (isPlaying) {
                                print('playing');
                              }
                              isPlaying == true
                                  ? audioPlayer.pause()
                                  : audioPlayer.play(UrlSource(widget.audio!));
                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            },
                            child: Icon(
                                isPlaying ? Icons.stop : Icons.play_arrow)),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: widget.isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.Sender}',
                            style: const TextStyle(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 42, 8, 48)),
                          ),
                          Container(
                              height: 100,
                              width: 100,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              alignment: widget.isMe
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => showImage(
                                        imageUrl: '${widget.imgurl}',
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    alignment: '${widget.imgurl}' != ""
                                        ? null
                                        : Alignment.center,
                                    child: '${widget.imgurl}' != ""
                                        ? Image.network('${widget.imgurl}',
                                            fit: BoxFit.cover)
                                        : const CircularProgressIndicator()),
                              )),
                        ]));
  }
}

class showImage extends StatelessWidget {
  String imageUrl;
  showImage({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: 100,
        width: 100,
        color: Colors.black,
        child: Image.network(imageUrl),
      ),
    );
  }
}
