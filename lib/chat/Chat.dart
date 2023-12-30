import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'msg_model.dart';
import 'other_msg_widget.dart';
import 'own_msg-widget.dart';

class chat extends StatefulWidget {
  final String name;
  final String userId;
  const chat({super.key, required this.name, required this.userId});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  IO.Socket? socket;
  //save send data
  List<msgModel> listmsg = [];
  TextEditingController _msgController = TextEditingController();
  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    socket = IO.io("http://localhost:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();

    socket!.onConnect((_) {
      print('connect');
      socket!.on("sendMsgServer", (msg) {
        print(msg);

        if (msg["userId"] != widget.userId) {
          setState(() {
            listmsg.add(
              msgModel(
                  msg: msg["msg"],
                  Type: msg["type"],
                  sender: msg["senderName"]),
            );
          });
        }
      });
    });
  }

  void sendmsg(String msg, String senderName) {
    msgModel ownmsg = msgModel(msg: msg, Type: "ownmsg", sender: senderName);
    listmsg.add(ownmsg);
    setState(() {
      listmsg;
    });
    socket!.emit('sendmsg', {
      "Type": "ownmsg", //type msg
      "msg": msg, //msg
      "senderName": senderName, //sender
      "userId": widget.userId,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Datasearch());
              },
              icon: Icon(Icons.search))
        ],
        backgroundColor: Color.fromARGB(255, 245, 155, 155),
        title: Text('CHAT'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listmsg.length,
                itemBuilder: (context, index) {
                  if (listmsg[index].Type == "ownmsg") {
                    return OwnMsgwidget(
                        msg: listmsg[index].msg, sender: listmsg[index].sender);
                  } else {
                    return OtherMsgwidget(
                        msg: listmsg[index].msg, sender: listmsg[index].sender);
                  }
                },
              ),
            ),
            Container(
              // decoration: BoxDecoration(border:Border(top:BorderSide(
              // color: Color.fromARGB(255, 245, 155, 155),

              // ),
              //  ),
              //),
              margin: EdgeInsets.all(15),
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Expanded(
                            child: TextField(
                              controller: _msgController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20, //20 before
                                ),
                                hintText: 'write your message here',
                                border: InputBorder.none,
                                // enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              String msg = _msgController.text;
                              if (msg.isNotEmpty) {
                                sendmsg(msg, widget.name);

                                _msgController
                                    .clear(); // امسح الرسالة بعد ما ابعتها
                              }
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      child: Icon(
                        Icons.keyboard_voice,
                        color: Colors.white,
                      ),
                      onLongPress: () {
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Datasearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (() {
            query = '';
          }),
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (() {
          close(context, null);
        }),
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("محتوى البحث"));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
