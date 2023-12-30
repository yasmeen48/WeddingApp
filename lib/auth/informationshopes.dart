// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';

import '../classes/BrideAccessories.dart';
import '../classes/BrideDress.dart';
import '../classes/CategoriesShops.dart';
import '../classes/DancingGroup.dart';
import '../classes/MusicDjs.dart';
import '../classes/PhotographicStudio.dart';
import '../classes/PlacesToShoot.dart';
import '../classes/Saloon.dart';
import '../classes/WeddingDecoration.dart';
import '../classes/WeddingFood_Cake.dart';
import '../classes/WeddingHall.dart';
import 'Shop.dart';

class information extends StatefulWidget {
  List<dynamic> list;
  String categoryname;
  CategoriesShops shop;

  //const information({super.key});
  information(this.list, this.categoryname, this.shop);
  @override
  State<information> createState() => _informationState();
}

class _informationState extends State<information> {
  @override
  List<BrideAccessories> listofaccessories = [];
  List<BrideDress> listofDress = [];
  List<DancingGroup> listofDancingGroup = [];
  List<MusicDjs> listofMusicDjs = [];
  List<PhotographicStudio> listofPhotographicStudio = [];
  List<PlacesToShoot> listofPlacesToShoot = [];
  List<Saloon> listofSaloon = [];
  List<WeddingFood_Cake> listofWeddingFood_Cake = [];
  List<WeddingDecoration> listofWeddingDecoration = [];
  List<WeddingHall> listofWeddingHall = [];
  void initState() {
    // then check the List[0].CategoryName
    if (widget.categoryname == 'Accessories') {
      widget.list.map((e) => listofaccessories.add(e));
    }
    if (widget.categoryname == 'Dress') {
      widget.list.map((e) => listofDress.add(e));
    }
    if (widget.categoryname == 'DancingGroup') {
      widget.list.map((e) => listofDancingGroup.add(e));
    }
    if (widget.categoryname == 'MusicDjs') {
      widget.list.map((e) => listofMusicDjs.add(e));
    }
    if (widget.categoryname == 'PhotographicStudio') {
      widget.list.map((e) => listofPhotographicStudio.add(e));
    }
    if (widget.categoryname == 'PlacesToShoot') {
      widget.list.map((e) => listofPlacesToShoot.add(e));
    }
    if (widget.categoryname == 'Saloon') {
      widget.list.map((e) => listofSaloon.add(e));
    }
    if (widget.categoryname == 'WeddingFood_Cake') {
      widget.list.map((e) => listofWeddingFood_Cake.add(e));
    }
    if (widget.categoryname == 'WeddingDecoration') {
      widget.list.map((e) => listofWeddingDecoration.add(e));
    }
    if (widget.categoryname == 'WeddingHall') {
      widget.list.map((e) => listofWeddingHall.add(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(235, 230, 179, 179),

          centerTitle: true,
          // ignore: unnecessary_new
          leading: new IconButton(
            // ignore: unnecessary_new
            icon: new Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => shope(widget.shop.CategoryId)),
              );
            }),
          ),
        ),
        body: SafeArea(
            child: Column(children: [
          Visibility(
              visible: listofaccessories.isNotEmpty,
              child: Column(children: [
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
                            child: Text("ShopeName:"),
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
                                child: Text('${widget.shop.ShopName}'))
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
                            child: const Text("location:"),
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
                              child: Text("${widget.shop.Location}"),
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
                              child: Text("${widget.shop.WorkingHour}"),
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
                                child: LinkText(
                                  'WebsiteLink: ${widget.shop.WebsiteLink}',
                                ),
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
                                child: Text("${widget.shop.PhoneNum}"),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            itemCount: listofaccessories.length,
                            itemBuilder: (context, int index) {
                              BrideAccessories key =
                                  listofaccessories.elementAt(index);
                              // padding: EdgeInsets.zero,
                              // ignore: unnecessary_new
                              return new Column(children: <Widget>[
                                Container(
                                    alignment: Alignment.topCenter,
                                    width: double.infinity,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                child:
                                                    const Text("some items: "),
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
                                              child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 150,
                                                            height: 150,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child:
                                                                Image.network(
                                                              '${key.ItemImage}',
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                              width: 150,
                                                            ),
                                                          ),
                                                          Text(
                                                            textAlign:
                                                                TextAlign.start,
                                                            'ItemName: ${key.ItemName}',
                                                            style: TextStyle(),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              "ItemInfo:${key.ItemInfo}"),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              "Price:${key.Price}"),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ]),
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                  ]))
                                        ]))
                              ]);
                            }),
                      ],
                    ))
              ])),
          //////////////////////////////////////////////////////////////////////
          ///
          Visibility(
              visible: listofDress.isNotEmpty,
              child: Column(children: [
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
                            child: Text("ShopeName:"),
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
                                child: Text('${widget.shop.ShopName}'))
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
                            child: const Text("location:"),
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
                              child: Text("${widget.shop.Location}"),
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
                              child: Text("${widget.shop.WorkingHour}"),
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
                                  child: LinkText(
                                    'WebsiteLink: ${widget.shop.WebsiteLink}',
                                  ),
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
                                  child: Text("${widget.shop.PhoneNum}"),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              itemCount: listofDress.length,
                              itemBuilder: (context, int index) {
                                BrideDress key = listofDress.elementAt(index);
                                // padding: EdgeInsets.zero,
                                // ignore: unnecessary_new
                                return new Column(children: <Widget>[
                                  Container(
                                      alignment: Alignment.topCenter,
                                      width: double.infinity,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              ////////////////images for items

                                              Container(
                                                  height: 300,
                                                  margin: const EdgeInsets.only(
                                                    left: 40,
                                                  ),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  width: double.infinity,
                                                  child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                'Service: ${key.ServiceInfo}',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Price:${key.PriceRange}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Dealing:${key.Dealing}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ]),
                                                        const SizedBox(
                                                          width: 25,
                                                        ),
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
                                                          child: const Text(
                                                              "some items: "),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img2}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img1}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img3}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      ]))
                                            ])
                                          ]))
                                ]);
                              })
                        ]))
              ])),

          ////////////////////////////////////////////////////////////
          ///
          Visibility(
              visible: listofDancingGroup.isNotEmpty,
              child: Column(children: [
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
                            child: Text("ShopeName:"),
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
                                child: Text('${widget.shop.ShopName}'))
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
                            child: const Text("location:"),
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
                              child: Text("${widget.shop.Location}"),
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
                              child: Text("${widget.shop.WorkingHour}"),
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
                                child: LinkText(
                                  'WebsiteLink: ${widget.shop.WebsiteLink}',
                                ),
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
                                child: Text("${widget.shop.PhoneNum}"),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            itemCount: listofDancingGroup.length,
                            itemBuilder: (context, int index) {
                              DancingGroup key =
                                  listofDancingGroup.elementAt(index);
                              // padding: EdgeInsets.zero,
                              // ignore: unnecessary_new
                              return new Column(children: <Widget>[
                                Container(
                                    alignment: Alignment.topCenter,
                                    width: double.infinity,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ////////////////images for items

                                          Container(
                                              height: 300,
                                              margin: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              alignment: Alignment.topCenter,
                                              width: double.infinity,
                                              child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            textAlign:
                                                                TextAlign.start,
                                                            'Service: ${key.Service}',
                                                            style: TextStyle(),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              "GroupGender:${key.GroupGender}"),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              "Price:${key.PriceRange}"),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ]),
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          height: 150,
                                                          margin:
                                                              EdgeInsets.all(5),
                                                          child: Image.network(
                                                            '${key.img}',
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            width: 150,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ]))
                                        ]))
                              ]);
                            }),
                      ],
                    ))
              ])),
          ////////////////////////////////////////////////////////////
          ///
          Visibility(
              visible: listofPhotographicStudio.isNotEmpty,
              child: Column(children: [
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
                            child: Text("ShopeName:"),
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
                                child: Text('${widget.shop.ShopName}'))
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
                            child: const Text("location:"),
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
                              child: Text("${widget.shop.Location}"),
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
                              child: Text("${widget.shop.WorkingHour}"),
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
                                  child: LinkText(
                                    'WebsiteLink: ${widget.shop.WebsiteLink}',
                                  ),
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
                                  child: Text("${widget.shop.PhoneNum}"),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              itemCount: listofPhotographicStudio.length,
                              itemBuilder: (context, int index) {
                                PhotographicStudio key =
                                    listofPhotographicStudio.elementAt(index);
                                // padding: EdgeInsets.zero,
                                // ignore: unnecessary_new
                                return new Column(children: <Widget>[
                                  Container(
                                      alignment: Alignment.topCenter,
                                      width: double.infinity,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              ////////////////images for items

                                              Container(
                                                  height: 300,
                                                  margin: const EdgeInsets.only(
                                                    left: 40,
                                                  ),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  width: double.infinity,
                                                  child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                'Service: ${key.Service}',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "TeamWorkGender:${key.TeamWorkGender}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Price:${key.PriceRange}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ]),
                                                        const SizedBox(
                                                          width: 25,
                                                        ),
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
                                                          child: const Text(
                                                              "some items: "),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img2}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img1}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img3}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      ]))
                                            ])
                                          ]))
                                ]);
                              })
                        ]))
              ])),

          ////////////////////////////////////////////////////////////
          ///
          Visibility(
              visible: listofMusicDjs.isNotEmpty,
              child: Column(children: [
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
                            child: Text("ShopeName:"),
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
                                child: Text('${widget.shop.ShopName}'))
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
                            child: const Text("location:"),
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
                              child: Text("${widget.shop.Location}"),
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
                              child: Text("${widget.shop.WorkingHour}"),
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
                                  child: LinkText(
                                    'WebsiteLink: ${widget.shop.WebsiteLink}',
                                  ),
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
                                  child: Text("${widget.shop.PhoneNum}"),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              itemCount: listofMusicDjs.length,
                              itemBuilder: (context, int index) {
                                MusicDjs key = listofMusicDjs.elementAt(index);
                                // padding: EdgeInsets.zero,
                                // ignore: unnecessary_new
                                return new Column(children: <Widget>[
                                  Container(
                                      alignment: Alignment.topCenter,
                                      width: double.infinity,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              ////////////////images for items

                                              Container(
                                                  height: 300,
                                                  margin: const EdgeInsets.only(
                                                    left: 40,
                                                  ),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  width: double.infinity,
                                                  child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                'Service: ${key.Service}',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Price:${key.PriceRange}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ]),
                                                        const SizedBox(
                                                          width: 25,
                                                        ),
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
                                                          child: const Text(
                                                              "some items: "),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      ]))
                                            ])
                                          ]))
                                ]);
                              })
                        ]))
              ])),

          ////////////////////////////////////////////////////////////

          Visibility(
              visible: listofPlacesToShoot.isNotEmpty,
              child: Column(children: [
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
                            child: Text("ShopeName:"),
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
                                child: Text('${widget.shop.ShopName}'))
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
                            child: const Text("location:"),
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
                              child: Text("${widget.shop.Location}"),
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
                              child: Text("${widget.shop.WorkingHour}"),
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
                                  child: LinkText(
                                    'WebsiteLink: ${widget.shop.WebsiteLink}',
                                  ),
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
                                  child: Text("${widget.shop.PhoneNum}"),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              itemCount: listofMusicDjs.length,
                              itemBuilder: (context, int index) {
                                PlacesToShoot key =
                                    listofPlacesToShoot.elementAt(index);
                                // padding: EdgeInsets.zero,
                                // ignore: unnecessary_new
                                return new Column(children: <Widget>[
                                  Container(
                                      alignment: Alignment.topCenter,
                                      width: double.infinity,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              ////////////////images for items

                                              Container(
                                                  height: 300,
                                                  margin: const EdgeInsets.only(
                                                    left: 40,
                                                  ),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  width: double.infinity,
                                                  child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                'PlaceType: ${key.PlaceType}',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Price:${key.PriceRange}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ]),
                                                        const SizedBox(
                                                          width: 25,
                                                        ),
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
                                                          child: const Text(
                                                              "some items: "),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img2}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img1}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img3}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      ]))
                                            ])
                                          ]))
                                ]);
                              })
                        ]))
              ])),

          ////////////////////////////////////////////////////////////

          Visibility(
              visible: listofSaloon.isNotEmpty,
              child: Column(children: [
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
                            child: Text("ShopeName:"),
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
                                child: Text('${widget.shop.ShopName}'))
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
                            child: const Text("location:"),
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
                              child: Text("${widget.shop.Location}"),
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
                              child: Text("${widget.shop.WorkingHour}"),
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
                                  child: LinkText(
                                    'WebsiteLink: ${widget.shop.WebsiteLink}',
                                  ),
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
                                  child: Text("${widget.shop.PhoneNum}"),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              itemCount: listofSaloon.length,
                              itemBuilder: (context, int index) {
                                Saloon key = listofSaloon.elementAt(index);
                                // padding: EdgeInsets.zero,
                                // ignore: unnecessary_new
                                return new Column(children: <Widget>[
                                  Container(
                                      alignment: Alignment.topCenter,
                                      width: double.infinity,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              ////////////////images for items

                                              Container(
                                                  height: 300,
                                                  margin: const EdgeInsets.only(
                                                    left: 40,
                                                  ),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  width: double.infinity,
                                                  child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                'ArtistGender: ${key.ArtistGender}',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Price:${key.PriceRange}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Service:${key.Service}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ]),
                                                        const SizedBox(
                                                          width: 25,
                                                        ),
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
                                                          child: const Text(
                                                              "some items: "),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img2}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img1}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img3}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      ]))
                                            ])
                                          ]))
                                ]);
                              })
                        ]))
              ])),

          ////////////////////////////////////////////////////////////

          Visibility(
              visible: listofWeddingDecoration.isNotEmpty,
              child: Column(children: [
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
                            child: Text("ShopeName:"),
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
                                child: Text('${widget.shop.ShopName}'))
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
                            child: const Text("location:"),
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
                              child: Text("${widget.shop.Location}"),
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
                              child: Text("${widget.shop.WorkingHour}"),
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
                                  child: LinkText(
                                    'WebsiteLink: ${widget.shop.WebsiteLink}',
                                  ),
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
                                  child: Text("${widget.shop.PhoneNum}"),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              itemCount: listofWeddingDecoration.length,
                              itemBuilder: (context, int index) {
                                WeddingDecoration key =
                                    listofWeddingDecoration.elementAt(index);
                                // padding: EdgeInsets.zero,
                                // ignore: unnecessary_new
                                return new Column(children: <Widget>[
                                  Container(
                                      alignment: Alignment.topCenter,
                                      width: double.infinity,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              ////////////////images for items

                                              Container(
                                                  height: 300,
                                                  margin: const EdgeInsets.only(
                                                    left: 40,
                                                  ),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  width: double.infinity,
                                                  child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                'Service: ${key.Service}',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Price:${key.PriceRange}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ]),
                                                        const SizedBox(
                                                          width: 25,
                                                        ),
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
                                                          child: const Text(
                                                              "some items: "),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img2}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img1}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img3}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      ]))
                                            ])
                                          ]))
                                ]);
                              })
                        ]))
              ])),

          ////////////////////////////////////////////////////////////

          Visibility(
              visible: listofWeddingFood_Cake.isNotEmpty,
              child: Column(children: [
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
                            child: Text("ShopeName:"),
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
                                child: Text('${widget.shop.ShopName}'))
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
                            child: const Text("location:"),
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
                              child: Text("${widget.shop.Location}"),
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
                              child: Text("${widget.shop.WorkingHour}"),
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
                                  child: LinkText(
                                    'WebsiteLink: ${widget.shop.WebsiteLink}',
                                  ),
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
                                  child: Text("${widget.shop.PhoneNum}"),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              itemCount: listofWeddingFood_Cake.length,
                              itemBuilder: (context, int index) {
                                WeddingFood_Cake key =
                                    listofWeddingFood_Cake.elementAt(index);
                                // padding: EdgeInsets.zero,
                                // ignore: unnecessary_new
                                return new Column(children: <Widget>[
                                  Container(
                                      alignment: Alignment.topCenter,
                                      width: double.infinity,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              ////////////////images for items

                                              Container(
                                                  height: 300,
                                                  margin: const EdgeInsets.only(
                                                    left: 40,
                                                  ),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  width: double.infinity,
                                                  child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                'Service: ${key.Service}',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Price:${key.PriceRange}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ]),
                                                        const SizedBox(
                                                          width: 25,
                                                        ),
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
                                                          child: const Text(
                                                              "some items: "),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img2}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img1}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img3}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      ]))
                                            ])
                                          ]))
                                ]);
                              })
                        ]))
              ])),

          ////////////////////////////////////////////////////////////
          Visibility(
              visible: listofWeddingHall.isNotEmpty,
              child: Column(children: [
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
                            child: Text("ShopeName:"),
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
                                child: Text('${widget.shop.ShopName}'))
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
                            child: const Text("location:"),
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
                              child: Text("${widget.shop.Location}"),
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
                              child: Text("${widget.shop.WorkingHour}"),
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
                                  child: LinkText(
                                    'WebsiteLink: ${widget.shop.WebsiteLink}',
                                  ),
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
                                  child: Text("${widget.shop.PhoneNum}"),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                              itemCount: listofWeddingHall.length,
                              itemBuilder: (context, int index) {
                                WeddingHall key =
                                    listofWeddingHall.elementAt(index);
                                // padding: EdgeInsets.zero,
                                // ignore: unnecessary_new
                                return new Column(children: <Widget>[
                                  Container(
                                      alignment: Alignment.topCenter,
                                      width: double.infinity,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              ////////////////images for items

                                              Container(
                                                  height: 300,
                                                  margin: const EdgeInsets.only(
                                                    left: 40,
                                                  ),
                                                  alignment:
                                                      Alignment.topCenter,
                                                  width: double.infinity,
                                                  child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                'Service: ${key.Service}',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "HallType:${key.HallType}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  "Price:${key.PriceRange}"),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ]),
                                                        const SizedBox(
                                                          width: 25,
                                                        ),
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
                                                          child: const Text(
                                                              "some items: "),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img2}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img1}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Container(
                                                              width: 150,
                                                              height: 150,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child:
                                                                  Image.network(
                                                                '${key.img3}',
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                width: 150,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      ]))
                                            ])
                                          ]))
                                ]);
                              })
                        ]))
              ])),

          ////////////////////////////////////////////////////////////
        ])));
  }
}
