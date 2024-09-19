import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';

class Page_2 extends StatelessWidget {
  const Page_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Image.asset(
                'assets/on_boarding_images/2.gif',
                height: 300,
                width: 300,
              ),
              Text(
                'Shega Store',
                style: TextStyle(
                  color: ThemeUI.texto,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
