import 'package:circular_image/circular_image.dart';

import 'package:flutter/material.dart';

class joinus extends StatefulWidget {
  const joinus({super.key});

  @override
  State<joinus> createState() => _joinusState();
}

class _joinusState extends State<joinus> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 85, 60, 78),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (index) {
                setState(() {
                  selectedindex = index;
                  if (selectedindex == 0) {
                    Navigator.of(context).pushNamed("home");
                  }
                  if (selectedindex == 2) {
                    Navigator.of(context).pushNamed("joinus");
                  }
                });
              },
              backgroundColor: Color.fromARGB(255, 59, 43, 55),
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 40,
              mouseCursor: SystemMouseCursors.click,
              selectedFontSize: 30,
              selectedItemColor: Color.fromARGB(255, 236, 224, 227),
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
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
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  CircularImage(
                    source: "images/register.jpg",
                    radius: 80,
                    borderWidth: 2,
                    borderColor: const Color.fromARGB(255, 85, 60, 78),
                    onImageTap: () {
                      Navigator.of(context).pushNamed("chatscreen");
                    },
                  ),
                  // i
                  //gnore: prefer_const_constructors
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Join Us On Bride Room ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 85, 60, 78),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )
                ],
              ),
            )));
  }
}
