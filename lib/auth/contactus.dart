import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(235, 230, 179, 179),
        /*  leading: new IconButton( icon:new Icon(Icons.arrow_back),
      onPressed: (() {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => sidebar()),
        
        );
        
      }
      ),
      */

        centerTitle: true,
        title: Text("Contact US"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 40,
            alignment: Alignment.bottomCenter,
            child: Text(
              "Information",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 90,
            child: Text(
              "Anyone who owns a bridal shop and wants to add it to our app can contact us.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 70),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.phone,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text("0569669156"),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 100),
                    width: 50,
                    height: 100,
                    child: Icon(
                      Icons.email,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 80),
                    width: 260,
                    child: Text("ayamasri52@yahoo.com"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 70),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.phone,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text("0569669156"),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 100),
                    width: 50,
                    height: 100,
                    child: Icon(
                      Icons.email,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 80),
                    width: 260,
                    child: Text("hadeelarrai52@yahoo.com"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 70),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.phone,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text("0569669156"),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 100),
                    width: 50,
                    height: 100,
                    child: Icon(
                      Icons.email,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 80),
                    width: 260,
                    child: Text("yassmenarra52@yahoo.com"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
