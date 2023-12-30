import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:weddingplanner/auth/login.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print("Account created succesful");
      return user;
    } else {
      print("Account created falid");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> loginAccount(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print("Login succesful");
      return user;
    } else {
      print("Login falid");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut().then(((value) {
      (Navigator.of(context).pushNamed("joinus"));
    }));
  } catch (e) {
    print("error");
  }
}
