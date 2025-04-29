import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/database/provider.dart';
import 'package:shega_cloth_store_app/screens/login.dart';

import '/database/auth.dart';
import '/prefs/loginPreference.dart';
import '/screens/first-page.dart';
import '/utils/snackBar.dart';
import '/utils/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool isCheak = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();
  bool isFinishedLogin = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    DocumentSnapshot<Map<String, dynamic>> userData;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
      backgroundColor: ThemeUI.darker,
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  ThemeUI.secondary,
                  ThemeUI.light,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 60, left: 22),
              child: Text(
                "Getting Started as admin\nCreate Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: height - 200,
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: userEmailController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "Gmail",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ThemeUI.secondary,
                            ),
                          )),
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "User name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ThemeUI.secondary,
                            ),
                          )),
                    ),
                    TextField(
                      controller: userpasswordController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ThemeUI.secondary,
                            ),
                          )),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isCheak,
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  isCheak = value;
                                });
                              }
                            },
                            visualDensity: VisualDensity(
                              horizontal: -3.0,
                              vertical: -3.0,
                            ),
                          ),
                          Text(
                            'By creating an account, you agree to our\n Term and Condition',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 55,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ThemeUI.primary),
                      child: Consumer<defaultt>(
                        builder: (context, value, child) {
                          return MaterialButton(
                            height: 60,
                            minWidth: width * 0.8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onPressed: () async {
                              setState(() {
                                isFinishedLogin = true;
                              });
                              String result = await authMethod().UserSignUp(
                                userName: usernameController.text,
                                email: userEmailController.text,
                                password: userpasswordController.text,
                              );
                              setState(() {
                                isFinishedLogin = false;
                              });
                              if (result == 'success') {
                                showSnack(
                                    'The e-mail verification has been sent to your email, verify before login',
                                    context);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => signin(),
                                  ),
                                );
                              } else {
                                showSnack(
                                  'please,enter correct information or register first!',
                                  context,
                                );
                              }
                            },
                            child: isFinishedLogin
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(
                                    width: width * 0.6,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Sign up',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: const Color.fromARGB(
                                                221, 255, 255, 255),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.login_outlined,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'You have an account?',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => signin(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign In',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
