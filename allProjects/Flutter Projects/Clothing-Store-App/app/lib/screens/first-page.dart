import 'package:shega_cloth_store_app/adminSide/tool.dart';

import '/screens/bottomBarScreens/Home.dart';
import '/screens/bottomBarScreens/product.dart';
import '/screens/bottomBarScreens/profile.dart';
import '/screens/bottomBarScreens/search.dart';
import '/database/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class first extends StatefulWidget {
  int page;
  first({super.key, this.page = 0});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  final pages = [
    HomeScreen(),
    SearchScreen(),
    productScreen(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[widget.page],
      bottomNavigationBar: GNav(
        onTabChange: (value) {
          setState(() {
            widget.page = value;
          });
        },
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        //tabBackgroundColor: Colors.grey,
        activeColor: ThemeUI.primary,
        selectedIndex: widget.page,
        color: ThemeUI.light,
        backgroundColor: ThemeUI.lighter,
        tabBorderRadius: 14,
        gap: 8,
        tabs: [
          GButton(
            icon: Icons.home,
            iconSize: 30,
            text: 'home',
          ),
          GButton(
            icon: Icons.search,
            iconSize: 30,
            text: 'search',
          ),
          GButton(
            icon: Icons.shopping_cart,
            iconSize: 30,
            text: 'product',
          ),
          GButton(
            icon: Icons.person_2_outlined,
            iconSize: 30,
            text: 'profile',
          )
        ],
      ),
    );
  }
}
