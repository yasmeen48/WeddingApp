import 'package:circular_image/circular_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
//import 'package:weddingplanner/Admin/catogeryadmin.dart';
import 'package:weddingplanner/Requsets/Requsets.dart';
import 'creatuser.dart';
import 'forgetpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();

  const Login({Key? key}) : super(key: key);
}

final _auth = FirebaseAuth.instance;
bool isloading = false;

String _username = "";
String _email = "";
String _phonenumber = "";
String _password = "";
bool userdata = false;
late SharedPreferences prefs;

class _SignupState extends State<Login> {
  bool _isvisible = false;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        // ),
        body: isloading
            ? Center(
                child: Container(
                    height: 10, width: 10, child: CircularProgressIndicator()))
            : Container(
                //rcolor: Color.fromARGB(255, 201, 170, 192),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    // ignore: sized_box_for_whitespace
                    Container(
                      child: Center(
                        child: CircularImage(
                          source: "images/register.jpg",
                          radius: 80,
                          //borderWidth: 2,
                          borderColor: const Color.fromARGB(255, 85, 60, 78),
                        ),

                        //  Image.asset("images/pride.jpg"),
                        //rheight: 120,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formstate,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(children: [
                        TextFormField(
                          controller: _usernameController,
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
                          //  maxLength: 15,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Enter Email",
                              hintStyle: const TextStyle(fontSize: 12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 9),
                                child: const Text("Email"),
                              ),
                              suffixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "please enter password";
                            }
                          }),
                          onChanged: (value) {
                            _password = value.toString();
                          },
                          keyboardType: TextInputType.visiblePassword,
                          maxLength: 15,
                          obscureText: !_isvisible,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isvisible = !_isvisible;
                                  });
                                },
                                icon: _isvisible
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : const Icon(Icons.visibility_off,
                                        color: Colors.grey),
                              ),
                              hintText: "Enter Password",
                              hintStyle: const TextStyle(fontSize: 12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 9),
                                child: const Text("Password"),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                          verticalDirection: VerticalDirection.down,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                prefs = await SharedPreferences.getInstance();
                                prefs.setString("username", _username);
                                // ignore: use_build_context_synchronously
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const ForgetPassword();
                                }));
                              },
                              child: const Text(
                                "Forget Password",
                                textAlign: TextAlign.end,
                              ),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () async {
                        if (_email.isNotEmpty && _password.isNotEmpty) {
                          setState(() {
                            isloading = true;
                          });
                          loginAccount(_email, _password).then((user) {
                            if (user != null) {
                              setState(() {
                                isloading = false;
                              });
                              print("login sucessful");
                            } else {
                              print("login falid");
                            }
                          });
                        } else {
                          print("please enter fields");
                        }
                        if (!formstate.currentState!.validate()) {
                          return null;
                        }
                        formstate.currentState!.save();
                        if (_email != null && _password != null) {
                          userLogin();
                          // Navigator.of(context).pushNamed("registerscreen");
                        }
                      },
                      color: Colors.white,
                      textColor: Colors.black,
                      child: const Text("Login",
                          style: TextStyle(fontFamily: "DancingScript")),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Row(
                      children: [
                        const Text("Dont have an account ?"),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("signup");
                            },
                            child: const Text("Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                )))
                      ],
                    ),
                  ],
                ),
              ));
  }

  Future<void> userLogin() async {
    Requset req = new Requset();
    req.login(_email, _password).then((value) async {
      if (value != null) {
        prefs = await SharedPreferences.getInstance();
        prefs.setString("userid", value.UserId.toString());
        prefs.setString("name", value.Name);
        prefs.setString("email", value.Email);
        prefs.setString("phonenumber", value.PhoneNumber);
        prefs.setString("location", value.Location);
        prefs.setString("password", value.Password);
        if (value.Type == 'Admin') {
          // MaterialPageRoute(builder: (context) => categoryadmin());
        } else {
          Navigator.of(context).pushNamed("registerscreen");
        }
      }
    });
  }
}
