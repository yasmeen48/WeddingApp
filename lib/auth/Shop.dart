import 'package:flutter/material.dart';
import 'package:weddingplanner/auth/informationshopes.dart';
import 'package:weddingplanner/classes/CategoriesShops.dart';
import '../Requsets/Requsets.dart';
import 'catagory.dart';

class shope extends StatefulWidget {
  // List shopp = [""];
  int CategoryId;
  @override
  shope(this.CategoryId);
  State<shope> createState() => _shopeState();
}

class _shopeState extends State<shope> {
  String NameShope = 'shopename';
  String imagename = 'images/register.jpg';
  int selectedindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    getshope();
  }

  Future<void> GetCItemdetalis(
      String desc, int id, CategoriesShops shop) async {
    Requset req = new Requset();

    req.GetCItemdetalis(desc, id).then((value) {
      if (value != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => information(value, desc, shop)),
        );
      }
    });
  }

  List<CategoriesShops> listofcategoryshops = [];
  Future<void> getshope() async {
    Requset req = new Requset();
    String location = "";

    req.GetCategoryItem(widget.CategoryId).then((value) {
      if (value != null) {
        // Navigator.of(context).pushNamed("login");
        for (var element in value) {
          listofcategoryshops.add(element);
        }
      }
    });
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
              // ignore: prefer_const_constructors
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
                    });
                  },
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.5,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: listofcategoryshops.length,
                      itemBuilder: (context, int index) {
                        CategoriesShops key =
                            listofcategoryshops.elementAt(index);
                        // padding: EdgeInsets.zero,
                        // ignore: unnecessary_new
                        <Widget>[
                          InkWell(
                            onTap: () {
                              /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (key.ShopId
                                  ));
                             */
                              GetCItemdetalis(
                                  key.CategoryName, key.ShopId, key);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  // ignore: sort_child_properties_last
                                  child: Image.network(
                                    "${key.img}",
                                    fit: BoxFit.cover,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  child: Text(
                                    "${key.ShopName}",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ];
                      }),
                );
              }),
        ));
  }
}
