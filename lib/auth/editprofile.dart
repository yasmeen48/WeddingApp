// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:date_count_down/countdown.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _isvisible = false;
  bool _isvisible1 = false;
  String? name = '';
  String? email = '';
  String? number;
  String? location = '';
  String? pass = '';
  String? phonenumer = '';
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    initState() async {
      prefs = await SharedPreferences.getInstance();
      name = prefs.getString("name");
      email = prefs.getString("email");
      number = prefs.getString("phonenumber");
      location = prefs.getString("location");
      pass = prefs.getString("password");
    }

    // ignore: unnecessary_new
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 85, 60, 78),
        ),
        body: Form(
          child: Container(
              padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
              child: ListView(children: [
                const Text('Edit Profile',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 25,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 4),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 10,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          image: const DecorationImage(
                            image: AssetImage('images/register.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              color: Colors.purple),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                )),
                const SizedBox(
                  height: 15,
                ),
                // ignore: prefer_const_constructors
                Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    // ignore: prefer_const_constructors
                    child: TextField(
                      
                      enabled: false,
                      decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Name",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          enabled: true,
                         // hintText:'$',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    )),
                // ignore: prefer_const_constructors
                Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    // ignore: prefer_const_constructors
                    child: TextField(
                      enabled: false,
                      decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "UserName",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          hintText: AutofillHints.username,
                          enabled: true,
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    )),
                // ignore: prefer_const_constructors
                Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    // ignore: prefer_const_constructors
                    child: TextField(
                      decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Email",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          enabled: true,
                          hintText: AutofillHints.email,
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    )),
                // ignore: prefer_const_constructors
                Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    // ignore: prefer_const_constructors
                    child: TextField(
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "PhomeNumber",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          enabled: true,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: TextField(
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Location",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          enabled: true,
                          hintText: AutofillHints.location,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: TextFormField(
                      onChanged: (value) {
                        phonenumer = value.toString();
                      },
                      validator: (value) {
                        if (phonenumer != number) {
                          return 'please enter a correct password';
                        }
                      },
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
                                : Icon(Icons.visibility_off,
                                    color: Colors.grey),
                            color: Colors.purple,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "OldPassword",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          enabled: true,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: TextField(
                      obscureText: !_isvisible1,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isvisible1 = !_isvisible1;
                              });
                            },
                            icon: _isvisible1
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : Icon(Icons.visibility_off,
                                    color: Colors.grey),
                            color: Colors.purple,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "NewPassword",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          enabled: true,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    )),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onPressed: () {},
                        color: const Color.fromARGB(255, 110, 72, 100),
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                        child: const Text(
                          "Cancle",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                          ),
                        )),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: const Color.fromARGB(255, 110, 72, 100),
                      textColor: Colors.white,
                      child: const Text("Conifrm",
                          style: TextStyle(
                              fontSize: 14, fontFamily: "Montserrat")),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ])),
        ));
  }
}
