// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weddingplanner/auth/catagory.dart';

class dancetroup extends StatefulWidget {
  List shopp = [""];

  @override
  State<dancetroup> createState() => _dancetroupState();
}

class _dancetroupState extends State<dancetroup> {
  String NameShope = 'shopename';
  String imagename = 'images/register.jpg';
  int selectedindex = 0;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(235, 230, 179, 179),
          title: Text(
            '${NameShope}',
          ),
          centerTitle: true,
          // ignore: unnecessary_new
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => catagory()),
              );
            }),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10, right: 10, left: 10),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.5,
                crossAxisSpacing: 25,
                mainAxisSpacing: 5,
              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedindex = index;
                      if (selectedindex == 0) {
                        Navigator.of(context).pushNamed("sh0dancetroupinfo");
                      }
                      if (selectedindex == 1) {
                        Navigator.of(context).pushNamed("sh1dancetroupinfo");
                      }
                      if (selectedindex == 2) {
                        Navigator.of(context).pushNamed("sh2dancetroupinfo");
                      }
                      if (selectedindex == 3) {
                        Navigator.of(context).pushNamed("sh3dancetroupinfo");
                      }

                      if (selectedindex == 4) {
                        Navigator.of(context).pushNamed("sh4dancetroupinfo");
                      }
                      if (selectedindex == 5) {
                        Navigator.of(context).pushNamed("sh5dancetroupinfo");
                      }
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset(
                          "${imagename}",
                          fit: BoxFit.cover,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          "name shop",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
