import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/screens/login.dart';

class Page_3 extends StatelessWidget {
  const Page_3({super.key});

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
                'assets/on_boarding_images/3.gif',
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
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                height: 60,
                minWidth: 350,
                color: ThemeUI.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => signin(),
                    ),
                  );
                },
                child: Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
