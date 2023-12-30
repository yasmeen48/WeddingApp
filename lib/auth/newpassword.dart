import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class newpassword extends StatefulWidget {
  const newpassword({super.key});

  @override
  State<newpassword> createState() => _newpasswordState();
}

class _newpasswordState extends State<newpassword> {
  bool _isvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Set a password",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "please create a secure password include the following criteria bellow.",
                  style: TextStyle(
                      fontSize: 16, height: 1.5, color: Colors.grey.shade600),
                ),
                TextField(
                  obscureText: !_isvisible,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isvisible = !_isvisible;
                          });
                        },
                        icon: _isvisible
                            ? Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : Icon(Icons.visibility_off, color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: "password",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                )
              ],
            )));
  }
}
