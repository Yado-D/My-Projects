import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/adminLogin.dart';
import 'package:shega_cloth_store_app/screens/signup.dart';

class AdminStarterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Starter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLogin()),
                );
              },
              child: Text('Admin Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signup()),
                );
              },
              child: Text('Admin Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
