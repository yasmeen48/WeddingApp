import 'dart:async';

import "package:flutter/material.dart";
import 'package:email_validator/email_validator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weddingplanner/Requsets/Requsets.dart';
import 'package:weddingplanner/auth/creatuser.dart';
import 'package:weddingplanner/classes/User.dart';
import 'package:phone_number/phone_number.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weddingplanner/classes/User.dart';

//import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();

  const Signup({Key? key}) : super(key: key);
}

bool _isvisible = false;
bool _isvisible1 = false;
bool isloading = false;

String _name = "";
String _username = "";
String _email = "";
String _phonenumber = "";
String _password = "";
String _Location = "";
String _compassword = "";
bool firstpart1 = false;
bool secondpart2 = false;
String _currentAddress = '';

Position? _position;

final loc = '';

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  GoogleMapController? googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _Getcurrentlocation() async {
    Position position = await _determinePosition();
    setState(() {
      _position = position;
      _getAddressFromLatLng();
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _position!.latitude, _position!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 85, 60, 78),
        ),
        body: isloading
            ? Center(
                child: Container(
                    height: 10, width: 10, child: CircularProgressIndicator()))
            : Container(
                //  color: Colors.deepPurple[200],
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(children: [
                  const SizedBox(height: 30),
                  Form(
                    key: formstate,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(children: [
                      TextFormField(
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "please enter Your name";
                          }
                        }),
                        onChanged: (value) {
                          _username = value.toString();
                        },
                        maxLength: 15,
                        decoration: InputDecoration(
                            hintText: "Enter Your Name",
                            hintStyle: const TextStyle(fontSize: 12),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: const Text(" Name"),
                            ),
                            suffixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "please enter user name";
                          }
                        }),
                        onChanged: (value) {
                          _name = value.toString();
                        },
                        maxLength: 15,
                        decoration: InputDecoration(
                            hintText: "Enter User Name",
                            hintStyle: const TextStyle(fontSize: 12),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: const Text("User Name"),
                            ),
                            suffixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "please enter email";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Please enter a valid email";
                          }
                          return null;
                        }),
                        onChanged: (value) {
                          _email = value.toString();
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Enter your Email",
                            hintStyle: const TextStyle(fontSize: 12),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: const Text("Email"),
                            ),
                            suffixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: ((value) {
                          if (!RegExp(
                                  r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                              .hasMatch(value.toString())) {
                            return "Please enter a valid number";
                          }
                          //return null;
                        }),
                        onChanged: (value) {
                          _phonenumber = value.toString();
                        },
                        keyboardType: TextInputType.phone,
                        maxLength: 15,
                        decoration: InputDecoration(
                            hintText: "Enter phone number",
                            hintStyle: const TextStyle(fontSize: 12),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: const Text("Phone number"),
                            ),
                            suffixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _pass,
                        keyboardType: TextInputType.visiblePassword,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "please enter password more than 6 digits ";
                          }
                        }),
                        onChanged: (value) {
                          _password = value.toString();
                        },
                        maxLength: 15,
                        obscureText: !_isvisible,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isvisible = !_isvisible;
                                });
                              },
                              icon: _isvisible
                                  ? Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : Icon(Icons.visibility_off,
                                      color: Colors.grey),
                            ),
                            hintText: "Enter Password",
                            hintStyle: const TextStyle(fontSize: 12),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: const Text("Password"),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _confirmPass,
                        onChanged: (value) {
                          _compassword = value.toString();
                        },
                        keyboardType: TextInputType.visiblePassword,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "please enter a password more than 6 digits";
                          } else if (value != _pass.text) {
                            return "Not Match";
                          }
                          return null;
                        }),
                        maxLength: 15,
                        obscureText: !_isvisible1,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isvisible1 = !_isvisible1;
                                });
                              },
                              icon: _isvisible1
                                  // ignore: prefer_const_constructors
                                  ? Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : Icon(Icons.visibility_off,
                                      color: Colors.grey),
                            ),
                            hintText: "conforim Password",
                            hintStyle: const TextStyle(fontSize: 12),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: const Text("conforim Password"),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      Center(
                        child: _position != null
                            ? TextButton(
                                child: Text('got location'),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Your Location'),
                                          content: setupAlertDialoadContainer(),
                                        );
                                      });
                                },
                              )
                            : Text('No Location Data'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _Getcurrentlocation();
                          googleMapController!.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(_position!.latitude,
                                      _position!.longitude),
                                  zoom: 14)));

                          markers.clear();

                          markers.add(Marker(
                              markerId: const MarkerId('currentLocation'),
                              position: LatLng(
                                  _position!.latitude, _position!.longitude)));

                          setState(() {});
                        },
                        tooltip: 'Increment',
                        child: Icon(Icons.location_on),
                      ),
                      Row(
                        children: [
                          const Text("If you have an account ?"),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("login");
                              },
                              child: const Text("Click here",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () async {
                          if (_name.isNotEmpty &&
                              _username.isNotEmpty &&
                              _email.isNotEmpty &&
                              _phonenumber.isNotEmpty &&
                              _position.toString().isNotEmpty &&
                              _password.isNotEmpty &&
                              _compassword.isNotEmpty) {
                            setState(() {
                              isloading = true;
                            });
                            createAccount(_name, _email, _password)
                                .then((user) {
                              if (user != null) {
                                setState(() {
                                  isloading = false;
                                });
                                print("Account creat sucessful");
                              } else {
                                print("Account creat falid");
                              }
                            });
                          } else {
                            print("please enter fields");
                          }
                          if (!formstate.currentState!.validate()) {
                            return null;
                          }
                          formstate.currentState!.save();
                          if (_name.isNotEmpty &&
                              _username.isNotEmpty &&
                              _email.isNotEmpty &&
                              _phonenumber.isNotEmpty &&
                              _position.toString().isNotEmpty &&
                              _password.isNotEmpty &&
                              _compassword.isNotEmpty) {
                            userSignup();
                            //Navigator.of(context).pushNamed("login");
                          }
                        },
                        color: const Color.fromARGB(255, 85, 60, 78),
                        textColor: Colors.black,
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ]),
                  ),
                ])));
  }

  Widget setupAlertDialoadContainer() {
    return GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        });
  }

  Future<void> userSignup() async {
    Requset req = new Requset();
    UserRegister user = new UserRegister(
        UserId: 0,
        Name: _name,
        UserName: _username,
        Email: _email,
        PhoneNumber: _phonenumber,
        Location: _position.toString(),
        Password: _password,
        Type: 'user');
    req.signup(user).then((value) {
      if (value != null) {
        Navigator.of(context).pushNamed("login");
      }
    });
  }
}
