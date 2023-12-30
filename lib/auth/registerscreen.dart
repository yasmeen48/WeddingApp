import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Requsets/Requsets.dart';
import '../classes/WeddingInfo.dart';
import 'package:google_fonts/google_fonts.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  TimeOfDay time = TimeOfDay(hour: 0, minute: 0);
  String? _pridename = '';
  String? _gromename = '';
  DateTime _date = new DateTime(2023);
  late SharedPreferences prefs;
  String userid = "";
  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 85, 60, 78),
            elevation: 0.0,
          ),
          body: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/6.jpg"),
                fit: BoxFit.cover,
              )),
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                // ignore: prefer_const_constructors
                Text(
                  "Please enter your wedding Details ..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 85, 60, 78),
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico'),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: formstate,
                  child: Column(
                    children: [
                      TextFormField(
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "please enter pride name";
                            }
                          }),
                          onChanged: (value) {
                            _pridename = value.toString();
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 9),
                                child: const Text("Bride Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    selectionColor:
                                        Color.fromARGB(255, 85, 60, 78)),
                              ),
                              suffixIcon: const Icon(Icons.girl),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(),
                              ))),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "please enter Groom name";
                            }
                          }),
                          onChanged: (value) {
                            _gromename = value.toString();
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 9),
                                child: const Text("Groom Name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    selectionColor:
                                        Color.fromARGB(255, 85, 60, 78)),
                              ),
                              suffixIcon: const Icon(Icons.boy),
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal()))),
                      const SizedBox(
                        height: 20,
                      ),
                      InputDatePickerFormField(
                        firstDate: DateTime(2023, 1, 1),
                        fieldLabelText: "Weddind Date",
                        errorFormatText: "Please enter right date",
                        lastDate: DateTime(3000, 1, 1),
                        onDateSaved: (value) {
                          _date = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 110, 72, 100))),
                          child: Text(
                            'Select Time',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () async {
                            TimeOfDay? newTime = await showTimePicker(
                                context: context, initialTime: time);
                            if (newTime == null) return;
                            setState(() => time = newTime);
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          formstate.currentState!.save();
                          if (_pridename!.isNotEmpty &&
                              _gromename!.isNotEmpty) {
                            Navigator.of(context)
                                .pushNamed("counterdown_screen");
                          }
                        },
                        color: Color.fromARGB(255, 110, 72, 100),
                        textColor: Colors.white,
                        child: Text("Confirm", style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                )
              ]))),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  Future<void> weddinginfo() async {
    prefs = await SharedPreferences.getInstance();
    userid = prefs.getString("userid").toString();
    int id = int.parse(userid);
    Requset req = new Requset();
    req
        .weddinginfo(
            WeddingInfo(
                BrideName: '${_pridename}',
                GroomName: '${_gromename}',
                WeddingDate: _date,
                WeddingTime: time,
                UserId: id,
                WeddingNum: 0),
            UserId: id)
        .then((value) {
      if (value != null) {
        Navigator.of(context).pushNamed("registerscreen");
      }
    });
  }
}
