import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/database/googleauth.dart';
import 'package:shega_cloth_store_app/database/provider.dart';
import 'package:shega_cloth_store_app/screens/resetpassword.dart';
import 'package:shega_cloth_store_app/utils/smallContainer.dart';

import '/adminSide/adminLogin.dart';
import '/database/auth.dart';
import '/prefs/loginPreference.dart';
import '/screens/first-page.dart';
import '/screens/signup.dart';
import '/utils/snackBar.dart';
import '/utils/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController userpasswordController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  bool isLoggingIn = false;
  bool isloggedin = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Map<String, dynamic> userData;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
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
                "Hello\nSign in",
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
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => reset(),
                            ));
                          },
                          child: Text(
                            'Forgot Password? ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: ThemeUI.textogr,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 55,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ThemeUI.primary),
                      child: Consumer<defaultt>(
                        builder: (context, value, child) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: ThemeUI.primary),
                            child: MaterialButton(
                                height: 60,
                                minWidth: 400,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                onPressed: () async {
                                  String result = await authMethod().UserSignin(
                                    email: userEmailController.text,
                                    password: userpasswordController.text,
                                  );
                                  if (result == 'success') {
                                    var snapshot = await _firestore
                                        .collection('users')
                                        .doc(
                                          FirebaseAuth
                                              .instance.currentUser!.uid,
                                        )
                                        .get();
                                    userData = snapshot.data()!;
                                    print(userData);
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .userSignInMap(userData);

                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => first(),
                                      ),
                                    );
                                    setState(() {
                                      value.toggle();
                                      value.isUserLogin();
                                    });
                                  } else if (result == 'verify') {
                                    showSnack(
                                      'Please, verify your email first!',
                                      context,
                                    );
                                  } else {
                                    showSnack(
                                      'please,enter correct information or register first!',
                                      context,
                                    );
                                  }
                                },
                                child: isloggedin
                                    ? Container(
                                        width: width * .6,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Center(
                                              child: Text(
                                                'Signin',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: const Color.fromARGB(
                                                      221, 255, 255, 255),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.login_outlined,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.green,
                                        ),
                                      )),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        smallcont(
                          images: 'assets/google.jpg',
                          ontapp: () => google().signInWithGoogle(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: ThemeUI.primary),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => AdminLogin(),
                                  ),
                                );
                              },
                              child: Text(
                                'Admin Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => signup(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
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
