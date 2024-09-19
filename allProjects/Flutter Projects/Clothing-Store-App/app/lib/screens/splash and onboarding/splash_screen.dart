import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/main.dart';
import 'package:shega_cloth_store_app/screens/first-page.dart';
import 'package:shega_cloth_store_app/screens/login.dart';
import 'package:lottie/lottie.dart';
import 'package:shega_cloth_store_app/screens/welcome.dart';

class Splash extends StatefulWidget {
  final bool isUserLoggedIn;

  const Splash({Key? key, required this.isUserLoggedIn}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget.isUserLoggedIn ? first() : welcome(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Lottie.asset(
                  'assets/lottie/Animation - 1710582571229.json',
                  height: 300,
                  width: 300,
                ),
                Text(
                  'Shega Store',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: ThemeUI.textogr,
                  ),
                ),
              ],
            ),
            CircularProgressIndicator(
              color: ThemeUI.primary,
            ),
          ],
        ),
      ),
    );
  }
}
