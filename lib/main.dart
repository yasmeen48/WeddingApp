import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:weddingplanner/Requsets/Requsets.dart';
import 'package:weddingplanner/auth/Chat_screen.dart';

import 'package:weddingplanner/auth/joinus.dart';

import 'package:weddingplanner/auth/Shop.dart';
import 'package:weddingplanner/auth/editprofile.dart';
import 'package:weddingplanner/auth/registerscreen.dart';
import 'package:weddingplanner/auth/catagory.dart';
import 'package:weddingplanner/backend/constant.dart';
import 'auth/counterdown-screen.dart';
import 'auth/home.dart';
import 'auth/informationshopes.dart';
import 'auth/signup.dart';
import 'auth/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // ignore: prefer_const_constructors
    options: FirebaseOptions(
        apiKey: "AIzaSyChj8AmZqYF9jufJbcW6HI7FooxyqhFqmo",
        appId: "1:605409976479:android:9f807bd49b0252c4b782aa",
        messagingSenderId:
            "605409976479-jvhk5s83j38a3haod85mbf92hskrg0t4.apps.googleusercontent.com",
        projectId: "my-chat-f9932",
        storageBucket: 'my-chat-f9932.appspot.com'),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instanceFor;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Login(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            textTheme: const TextTheme(
                displayLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    fontFamily: "Pacifico0",
                    color: Colors.black))),
        routes: {
          "signup": (context) => const Signup(),
          "login": (context) => const Login(),
          "registerscreen": (context) => const Registerscreen(),
          "counterdown_screen": (context) => Counterdown_screen(),
          "home": (context) => const catagory(),
          "editprofile": (context) => const EditProfile(),
          "chatscreen": (context) => Chat_screen(),
          "joinus": (context) => const joinus(),
        });
  }
}
