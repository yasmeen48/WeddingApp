import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weddingplanner/auth/Chat_screen.dart';
import 'package:weddingplanner/auth/login.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return Chat_screen(); /////////////// حسب الشات الي بدي ياها
    } else {
      return Login();
    }
  }
}
