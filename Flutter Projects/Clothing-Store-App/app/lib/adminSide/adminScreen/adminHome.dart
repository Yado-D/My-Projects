import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/database/models/product.dart';

import '/adminSide/adminScreen/catagories/catagories.dart';
import '/adminSide/adminScreen/dashboard.dart';
import '/adminSide/adminScreen/order/orders.dart';
import '/adminSide/adminScreen/products/products.dart';
import '/adminSide/adminScreen/settings.dart';
import 'package:flutter/material.dart';

class adminHome extends StatefulWidget {
  const adminHome({super.key});

  @override
  State<adminHome> createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  int _selectedIndex = 0;

  final List<Widget> _destinations = [
    dashBoard(),
    Categories(),
    products(
      title: "Products",
    ),
    orders(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: ThemeUI.primary,
        unselectedItemColor: ThemeUI.light,
        backgroundColor: ThemeUI.lighter,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: Stack(children: [
        _destinations[_selectedIndex],
      ] // Display the selected destination
          ),
    );
  }
}
