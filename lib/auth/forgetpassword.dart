import 'package:flutter/material.dart';
import 'package:weddingplanner/Requsets/Requsets.dart';
import 'package:weddingplanner/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

String _email = "";
String _username = "";
late SharedPreferences prefs;

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.purple[200],
        content: Text(
          'Password Reset Email has been sent !',
          style: TextStyle(fontSize: 18.0),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.purple[200],
          content: Text(
            'No user found for that email.',
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 85, 60, 78),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Text(
                "Enter Your Email and we will send you a password reset link .",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: formstate,
              autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return "please enter email";
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                }),
                onSaved: (value) {
                  _email = value.toString();
                },
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: const TextStyle(fontSize: 12),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 9),
                      child: const Text("Email"),
                    ),
                    suffixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () async {
                  if (!formstate.currentState!.validate()) {
                    return null;
                  }
                  formstate.currentState!.save();
                  if (_email != null) {
                    resetPassword();
                    forgetpassword();
                  }
                },
                color: Color.fromARGB(255, 85, 60, 78),
                textColor: Colors.black,
                child: const Text(
                  "Reset Password",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  const Text("Return to LoginPage ?"),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("login");
                      },
                      child: const Text("Click here",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 85, 60, 78),
                          )))
                ],
              ),
            )
          ]),
        ));
  }

  Future<void> forgetpassword() async {
    Requset req = new Requset();

    req.forgetPass(_email).then((value) {
      if (value != null) {
        Navigator.of(context).pushNamed("login");
      }
    });
  }
}
