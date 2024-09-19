import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class result_page extends StatelessWidget {
  const result_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.WhiteColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ReusableText(
              TextString: 'Physics',
              FontSize: 20,
              TextColor: ColorCollections.SecondaryColor,
              TextFontWeight: FontWeight.w700,
            ),
            Row(
              children: [
                ReusableText(
                  TextString: 'Time =',
                  FontSize: 20,
                  TextColor: ColorCollections.SecondaryColor,
                  TextFontWeight: FontWeight.w700,
                ),
                ReusableText(
                  TextString: 'Finished',
                  FontSize: 20,
                  TextColor: ColorCollections.RedColor,
                  TextFontWeight: FontWeight.w700,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ReusableText(
            FromTop: 90,
            TextString: 'Bad',
            FontSize: 40,
            FromBottom: 0,
            TextColor: ColorCollections.SecondaryColor,
            TextFontWeight: FontWeight.w700,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(),
              child: CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 20.0,
                percent: 1.0,
                center: ReusableText(
                  TextString: '100%',
                  FontSize: 40,
                  TextColor: ColorCollections.SecondaryColor,
                  TextFontWeight: FontWeight.w700,
                ),
                progressColor: Colors.red,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/retry.png'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/exam_starting_page');
              },
              child: AppButton(
                ContainerColor: ColorCollections.SecondaryColor,
                ButtonText: 'Try again',
                ButtonColor: ColorCollections.WhiteColor,
                ButtonHeight: 50,
                ButtonWidth: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
