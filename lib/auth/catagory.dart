// ignore_for_file: camel_case_types, unnecessary_const

import 'package:circular_image/circular_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weddingplanner/Requsets/Requsets.dart';
import 'package:weddingplanner/auth/Shop.dart';
import 'package:weddingplanner/auth/contactus.dart';
import 'package:weddingplanner/auth/counterdown-screen.dart';
import 'package:weddingplanner/auth/creatuser.dart';
import 'package:weddingplanner/classes/Category.dart' as Category;

//import 'package:untitled/navbar.dart';
class catagory extends StatefulWidget {
  const catagory({super.key});

  @override
  State<catagory> createState() => _catagoryState();
}

class _catagoryState extends State<catagory> {
  @override
  void initState() {
    // TODO: implement initState
    getcategory();
  }

  List<Category.Category> listofcategory = [];
  int selectedindex = 0;
  String? _name = '';
  String? email = '';
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    setState(() async {
      prefs = await SharedPreferences.getInstance();
      _name = prefs.getString("name");
      email = prefs.getString("email");
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 60, 78),
        title: const Text('Catagory'),
        centerTitle: true,
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
      body: SafeArea(
        child: ListView.builder(
            itemCount: listofcategory.length,
            itemBuilder: (context, int index) {
              Category.Category key = listofcategory.elementAt(index);
              // padding: EdgeInsets.zero,
              // ignore: unnecessary_new
              return new Column(children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.grey),
                  title: Text(
                    "${key.CategoryName}",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => shope(key.CategoryId)),
                  ),
                ),
              ]);
            }),
      ),
    );
  }

  Future<void> getcategory() async {
    Requset req = new Requset();

    req.GetCategory().then((value) {
      if (value != null) {
        // Navigator.of(context).pushNamed("login");
        for (var element in value) {
          listofcategory.add(element);
        }
      }
    });
  }
}
