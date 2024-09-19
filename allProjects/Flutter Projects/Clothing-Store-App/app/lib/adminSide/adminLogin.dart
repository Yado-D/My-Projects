import 'package:shega_cloth_store_app/adminSide/adminScreen/adminHome.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/database/provider.dart';
import 'package:shega_cloth_store_app/screens/login.dart';

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
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController adminpasswordController = TextEditingController();
  TextEditingController adminEmailController = TextEditingController();
  bool isloggedin = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Map<String, dynamic> userData;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
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
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: adminEmailController,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        label: Text(
                          "Gmail",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ThemeUI.primary,
                          ),
                        )),
                  ),
                  TextField(
                    controller: adminpasswordController,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        label: Text(
                          "Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ThemeUI.primary,
                          ),
                        )),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xff281537),
                      ),
                    ),
                  ),
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
                              minWidth: width * 0.8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isloggedin = false;
                                });
                                String result = await authMethod().adminSignIn(
                                  adminEmail: adminEmailController.text,
                                  adminPassword: adminpasswordController.text,
                                );
                                setState(() {
                                  isloggedin = true;
                                });
                                if (result == 'success') {
                                  var snapshot = await _firestore
                                      .collection('admins')
                                      .doc(
                                        FirebaseAuth.instance.currentUser!.uid,
                                      )
                                      .get();
                                  userData = snapshot.data()!;
                                  print(userData);
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .adminSignInMap(userData);
                                  print(userData);
                                  showSnack(
                                    'Welcome back!',
                                    context,
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => adminHome(),
                                    ),
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
                                      width: width * 0.6,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Signin',
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
                  SizedBox(
                    height: 10,
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => signin(),
                                ),
                              );
                            },
                            child: Text(
                              'User Login',
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
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
