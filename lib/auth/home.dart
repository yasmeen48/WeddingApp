import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:size_config/size_config.dart';
import 'package:circular_image/circular_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Container(
          // width: SizeConfig.safeBlockHorizontal * 45,
          child: Drawer(
              child: ListView(padding: EdgeInsets.zero, children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  //  color: kPrimaryColor,
                  ),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Container(

                          //width: SizeConfig.safeBlockHorizontal * 25,
                          //height:SizeConfig.safeBlockVertical * 6,
                          decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('images/pride.jpg'),
                        ),
                      )),
                      const SizedBox(
                          //height: SizeConfig.safeBlockVertical * 0.2,
                          ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(),
                            //CircularImage(
                            // source: "images/pride.jpg",
                            //badgeSize: 40,
                            //),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: const [
                              Text(
                                'username',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            ListTile(
              // leading: SvgPicture.asset
              leading: const Icon(Icons.star, size: 30),
              title: const Text('Rating'),
              onTap: () {},
            ),
            const ListTile(
              leading: Icon(
                Icons.phone,
                size: 30.0,
                color: Colors.grey,
              ),
              title: Text('Contact Us'),
            ),
            const ListTile(
              leading: Icon(
                Icons.settings,
                size: 30.0,
                color: Colors.grey,
              ),
              title: Text('Setting'),
            ),
            const ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 30.0,
                  color: Colors.grey,
                ),
                title: Text('Logout'))
          ])),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 85, 60, 78),
        ),
      ),
    );
  }
}
