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
          FullPageContainer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
              Container(
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
          Positioned(
            bottom: 1,
            child: BottomTextAndButton(),
          ),
        ],
      ),
    );
  }
}
