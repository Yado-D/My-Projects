import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/AppColorCollections.dart';
import '../../../../widgets/AllCommonWidget.dart';
import '../Widget/welcomePage1Widget.dart';

class WelcomePage1 extends StatelessWidget {
  const WelcomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: ColorCollections.PageColor,
      body: Stack(
        children: [
          // const FullPageContainer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: ReusableText(
                            TextString: 'WELCOME TO',
                            FontSize: 48,
                            FromTop: 20,
                            FromLeft: 0,
                            FromBottom: 0,
                            TextFontWeight: FontWeight.bold,
                            TextColor: ColorCollections.TextColor,
                          ),
                      ),

                      ReusableText(
                          TextString: 'EXAM',
                          FontSize: 48,
                          FromTop: 0,
                          FromBottom: 0,
                          FromLeft: 0,
                          TextColor: ColorCollections.SecondaryColor,
                        ),

                      ReusableText(
                        TextString: 'COLLECTORS',
                        FontSize: 48,
                        FromTop: 0,
                        FromLeft: 0,
                        TextColor: ColorCollections.SecondaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          BottomTextAndButton(),

        ],
      ),
    );
  }
}
