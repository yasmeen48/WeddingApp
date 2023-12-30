import 'package:flutter/material.dart';
import 'chat.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class room_bride extends StatefulWidget {
  const room_bride({super.key});

  @override
  State<room_bride> createState() => _room_brideState();
}

class _room_brideState extends State<room_bride> {
  TextEditingController nameController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(235, 230, 179, 179),
          title: Text('Room_Bride'),
          centerTitle: true,
        ),
        body: Center(
          child: TextButton(
              onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text("enter your name"),
                      content: Form(
                        key: formkey,
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.length < 3) {
                              return "you must enter your name and length >=3";
                            }
                            return null;
                          },
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: (() {
                              Navigator.pop(context);
                              nameController.clear();
                            }),
                            child: Text(
                              "Cancle",
                              style: TextStyle(color: Colors.red),
                            )),
                        TextButton(
                            onPressed: (() {
                              if (formkey.currentState!.validate()) {
                                String name = nameController.text;
                                nameController.clear();
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => chat(
                                      name: name,
                                      userId: uuid.v1(),
                                    ),
                                  ),
                                );
                              }
                            }),
                            child: Text("Enter")),
                      ],
                    ),
                  ),
              child: Text(
                "Login room_bride",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold,
                ),
              )),
        ));
  }
}
