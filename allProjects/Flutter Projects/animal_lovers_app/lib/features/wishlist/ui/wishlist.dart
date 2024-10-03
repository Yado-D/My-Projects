import 'package:flutter/material.dart';

class wishlistPage extends StatelessWidget {
  const wishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
        child: Text("WishList"),
       ),
      ),
    );
  }
}
