// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:circular_image/circular_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:date_count_down/countdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weddingplanner/Requsets/Requsets.dart';
import 'package:weddingplanner/classes/WeddingInfo.dart';

import 'creatuser.dart';

class Counterdown_screen extends StatefulWidget {
  const Counterdown_screen({super.key});

  @override
  State<Counterdown_screen> createState() => _Counterdown_screenState();
}

class _Counterdown_screenState extends State<Counterdown_screen> {
  int selectedindex = 0;
  String? _name = '';
  String? email = '';
  String? gromname = 'gromName';
  String? bridename = 'brideName';
  late SharedPreferences prefs;
  String userid = "";
  WeddingInfo? weddinginformation;

  @override
  Widget build(BuildContext context) {
    initState() async {
      prefs = await SharedPreferences.getInstance();
      _name = prefs.getString("name");
      email = prefs.getString("email");
    }

    // ignore: unnecessary_new
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 85, 60, 78),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                 '${_name}',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  '${email}',
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: CircularImage(
                    source: 'images/pridey.png',
                    radius: 50,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 85, 60, 78),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.grey),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () => Navigator.of(context).pushNamed("editprofile"),
              ),
              ListTile(
                leading: Icon(Icons.share, color: Colors.grey),
                title: Text(
                  'Share',
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () => Share.share(
                    "https://play.google.com/store/apps/details?id=com.instructivetech.testapp"),
              ),
              ListTile(
                leading: Icon(Icons.contacts, color: Colors.grey),
                title: Text(
                  'Contact us',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const Counterdown_screen();
                    }),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.grey),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onTap: () => logOut(context),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (index) {
            setState(() {
              selectedindex = index;
              if (selectedindex == 1) {
                Navigator.of(context).pushNamed("counterdown_screen");
              }
              if (selectedindex == 0) {
                Navigator.of(context).pushNamed("home");
              }
              if (selectedindex == 2) {
                Navigator.of(context).pushNamed("joinus");
              }
            });
          },
          backgroundColor: const Color.fromARGB(255, 59, 43, 55),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 40,
          mouseCursor: SystemMouseCursors.click,
          selectedFontSize: 30,
          selectedItemColor: const Color.fromARGB(255, 236, 224, 227),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category_sharp,
                color: Colors.white,
              ),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call_rounded, color: Colors.white),
              label: ' ',
            )
          ],
        ),
        body: ListView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //  const SizedBox(
                //  height: 20,
                //),s
                SizedBox(
                  height: 30,
                ),
                CircularImage(
                  source: "images/register.jpg",
                  radius: 70,
                  //borderWidth: 2,
                  borderColor: const Color.fromARGB(255, 85, 60, 78),
                ),
                Container(
                    width: 400,
                    height: 90,
                    child: Center(
                      child: Text(
                        ' ${weddinginformation!.BrideName} & ${weddinginformation!.GroomName}',
                        style: TextStyle(
                            fontFamily: "Pacifico",
                            fontSize: 20,
                            color: Color.fromARGB(255, 85, 60, 78)),
                      ),
                    )),
                CountDownText(
                  due: DateTime.parse(
                      "${weddinginformation!.WeddingDate} ${weddinginformation!.WeddingTime}"),
                  finishedText: "Its your date, congratulations",
                  showLabel: true,
                  longDateName: true,
                  daysTextLong: " Day, ",
                  hoursTextLong: " Hour, ",
                  minutesTextLong: " Min, ",
                  secondsTextLong: " Sec ",
                  style: const TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 20,
                      color: Color.fromARGB(255, 85, 60, 78)),
                ),
              ],
            ),
          )
        ]));
  }

  Future<void> GetweddingInfo() async {
    prefs = await SharedPreferences.getInstance();
    userid = prefs.getString("userid").toString();
    int id = int.parse(userid);
    Requset req = new Requset();
    req.GetweddingInfo(id).then((value) {
      if (value != null) {
        weddinginformation = value;
      }
    });
  }
}
