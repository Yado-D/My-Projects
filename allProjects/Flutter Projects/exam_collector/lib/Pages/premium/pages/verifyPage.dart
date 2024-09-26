import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCollections.PrimaryColor,
      ),
      body: Stack(
        children: [
          const FullPageContainer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
                child: ReusableText(
                  FromTop: 10,
                  FromBottom: 0,
                  FromLeft: 25,
                  TextString: 'Please wait',
                  FontSize: 48,
                  TextColor: ColorCollections.SecondaryColor,
                  TextFontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: ReusableText(
                  FromTop: 0,
                  FromLeft: 25,
                  TextString: 'Until We Verified',
                  FontSize: 48,
                  TextColor: ColorCollections.SecondaryColor,
                  TextFontWeight: FontWeight.w500,
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  height: 70,
                  width: 70,
                  child: const CircularProgressIndicator(),
                ),
              ),
              Center(
                child: ReusableText(
                  FromTop: 40,
                  TextString: 'Good things comes for those who wait. ',
                  FontSize: 20,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReusableText(
                  FromLeft: 30,
                  TextColor: ColorCollections.WhiteColor,
                  TextString:
                      'If you want to speed up the process\n   call to this number : ',
                  FontSize: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: ReusableText(
                    TextColor: Colors.blue,
                    TextString: '+251993157092',
                    FontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
