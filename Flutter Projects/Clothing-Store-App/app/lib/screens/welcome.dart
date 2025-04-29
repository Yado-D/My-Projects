import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/screens/splash%20and%20onboarding/intro_pages.dart/page_1.dart';
import 'package:shega_cloth_store_app/screens/splash%20and%20onboarding/intro_pages.dart/page_2.dart';
import 'package:shega_cloth_store_app/screens/splash%20and%20onboarding/intro_pages.dart/page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/screens/bottomBarScreens/Home.dart';
import '/screens/login.dart';
import '/utils/collections.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            Page_1(),
            Page_2(),
            Page_3(),
          ],
        ),

        // dot indicator
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // skip
              GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        color: ThemeUI.darker,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),

              //dot indicator
              SmoothPageIndicator(controller: _controller, count: 3),

              // done
              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return signin();
                        }));
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                            color: ThemeUI.darker,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ))
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
            ],
          ),
        )
      ]),
    );
  }
}
