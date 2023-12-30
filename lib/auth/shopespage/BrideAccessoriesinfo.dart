// ignore: file_names
import 'package:flutter/material.dart';
import '../Shop.dart';

class BrideAccessoriesinfo extends StatefulWidget {
  const BrideAccessoriesinfo({super.key});

  @override
  State<BrideAccessoriesinfo> createState() => _BrideAccessoriesinfoState();
}

class _BrideAccessoriesinfoState extends State<BrideAccessoriesinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(235, 230, 179, 179),
        title: const Text('name shope'),
        centerTitle: true,
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => shope(123)),
            );
          }),
        ),
      ),
      body: ListView(
        children: [
          //////////////////111111111111

          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 50,
                      child: const Icon(
                        Icons.contact_support,
                        size: 30,
                      ),
                    ),
                    Container(
                      width: 100,
                      child: const Text("about: "),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        width: 500,
                        child: const Text("about shope from  data   "),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ////////////////////222222222222222222222222222222

          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 50,
                      child: const Icon(
                        Icons.location_on,
                        size: 30,
                      ),
                    ),
                    Container(
                      width: 100,
                      child: const Text("location: "),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        width: 500,
                        child: const Text("location"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

////////////////////////3333333333333333333333333333333333333333333333333

          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 50,
                      child: const Icon(
                        Icons.price_change,
                        size: 30,
                      ),
                    ),
                    Container(
                      width: 100,
                      child: const Text("price change: "),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        width: 500,
                        child: const Text(" price"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

/////////////44444444444444444444444444444444444444444444444444444444444444

          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 50,
                      child: const Icon(
                        Icons.watch_later,
                        size: 30,
                      ),
                    ),
                    Container(
                      width: 100,
                      child: const Text("work hours: "),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        width: 500,
                        child: const Text("hours"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
// ////////////////////////////////555555555555555555555555555
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 50,
                      child: const Icon(
                        Icons.contacts,
                        size: 30,
                      ),
                    ),
                    Container(
                      width: 100,
                      child: const Text("contact of:"),
                    ),
                  ],
                ),

                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        height: 50,
                        child: const Icon(
                          Icons.facebook,
                          size: 20,
                        ),
                      ),
                      Container(
                        width: 500,
                        child: const Text("link face"),
                      ),
                    ],
                  ),
                ),

                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        height: 50,
                        child: const Icon(
                          Icons.phone,
                          size: 20,
                        ),
                      ),
                      Container(
                        width: 500,
                        child: const Text("phone number"),
                      ),
                    ],
                  ),
                ),

                //for email

                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        height: 50,
                        child: const Icon(
                          Icons.email,
                          size: 20,
                        ),
                      ),
                      Container(
                        width: 500,
                        child: const Text("email shope:"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

///////////////////////666666666666666666666666
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.image_sharp,
                        size: 30,
                      ),
                    ),
                    Container(
                      width: 100,
                      child: const Text("some items: "),
                    ),
                  ],
                ),
                ////////////////images for items

                Container(
                  height: 300,
                  margin: const EdgeInsets.only(
                    left: 40,
                  ),
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.all(5),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfDrvgAsrEtXrYBjt-EQru6lC2dI1HpBS2OTSllYawHzRtvMcNtj78gsbK4uAnwFpmE1A&usqp=CAU",
                              fit: BoxFit.fitWidth,
                              width: 150,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            'ItemName:',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("ItemInfo:"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Price:"),
                          SizedBox(
                            height: 5,
                          ),
                        ]),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.all(5),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfDrvgAsrEtXrYBjt-EQru6lC2dI1HpBS2OTSllYawHzRtvMcNtj78gsbK4uAnwFpmE1A&usqp=CAU",
                              fit: BoxFit.fitWidth,
                              width: 150,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            'ItemName:',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("ItemInfo:"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Price:"),
                          SizedBox(
                            height: 5,
                          ),
                        ]),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.all(5),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfDrvgAsrEtXrYBjt-EQru6lC2dI1HpBS2OTSllYawHzRtvMcNtj78gsbK4uAnwFpmE1A&usqp=CAU",
                              fit: BoxFit.fitWidth,
                              width: 150,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            'ItemName:',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("ItemInfo:"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Price:"),
                          SizedBox(
                            height: 5,
                          ),
                        ]),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.all(5),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfDrvgAsrEtXrYBjt-EQru6lC2dI1HpBS2OTSllYawHzRtvMcNtj78gsbK4uAnwFpmE1A&usqp=CAU",
                              fit: BoxFit.fitWidth,
                              width: 150,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            'ItemName:',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("ItemInfo:"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Price:"),
                          SizedBox(
                            height: 5,
                          ),
                        ]),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.all(5),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfDrvgAsrEtXrYBjt-EQru6lC2dI1HpBS2OTSllYawHzRtvMcNtj78gsbK4uAnwFpmE1A&usqp=CAU",
                              fit: BoxFit.fitWidth,
                              width: 150,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            'ItemName:',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("ItemInfo:"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Price:"),
                          SizedBox(
                            height: 5,
                          ),
                        ]),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.all(5),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfDrvgAsrEtXrYBjt-EQru6lC2dI1HpBS2OTSllYawHzRtvMcNtj78gsbK4uAnwFpmE1A&usqp=CAU",
                              fit: BoxFit.fitWidth,
                              width: 150,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            'ItemName:',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("ItemInfo:"),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Price:"),
                          SizedBox(
                            height: 5,
                          ),
                        ])
                  ]),
                )
              ],
            ),
          ),
        ], //last
      ),
    );
  }
}
