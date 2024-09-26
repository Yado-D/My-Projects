import 'package:flutter/material.dart';

import '../../../../utils/AppColorCollections.dart';
import '../../../../widgets/AllCommonWidget.dart';
import '../Widget/welcomePage1Widget.dart';

class WelcomePage1 extends StatelessWidget {
  const WelcomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FullPageContainer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.black,
                margin: EdgeInsets.only(left:120,top:40),
                child: Image.asset(
                  "assets/Images/EC-logo.ico",
                  height: 170,
                ),
              ),
              SizedBox(
                height: 98,
                child: ReusableText(
                  TextString: 'WELCOME TO',
                  FontSize: 48,
                  FromTop: 45,
                  FromLeft: 30,
                  FromBottom: 0,
                  TextFontWeight: FontWeight.bold,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
              SizedBox(
                height: 53,
                child: ReusableText(
                  TextString: 'EXAM',
                  FontSize: 48,
                  FromTop: 0,
                  FromBottom: 0,
                  FromLeft: 30,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
              ReusableText(
                TextString: 'COLLECTORS',
                FontSize: 48,
                FromTop: 0,
                FromLeft: 30,
                TextColor: ColorCollections.SecondaryColor,
              ),
            ],
          ),
          const Positioned(
            bottom: 1,
            child: BottomTextAndButton(),
          ),
        ],
      ),
    );
  }
}
