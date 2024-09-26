import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

class exam_starting_page extends StatelessWidget {
  exam_starting_page({
    super.key,
  });
  int time = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 120, left: 40),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  TextString: 'This Exam Takes : $time hours',
                  FontSize: 16,
                  TextFontWeight: FontWeight.w500,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                ReusableText(
                  FromTop: 20,
                  TextString: 'Please Choose What Method ',
                  FontSize: 16,
                  TextFontWeight: FontWeight.w500,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                ReusableText(
                  FromTop: 0,
                  TextString: 'You Want To Chose',
                  FontSize: 16,
                  TextFontWeight: FontWeight.w500,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 40, left: 20),
                    child: AppButton(
                      ButtonHeight: 50,
                      ButtonWidth: 180,
                      ContainerColor: ColorCollections.WhiteColor,
                      ButtonColor: ColorCollections.SecondaryColor,
                      ButtonText: 'Instant Answer',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 40, left: 20),
                    child: AppButton(
                      ButtonHeight: 50,
                      ButtonWidth: 180,
                      ContainerColor: ColorCollections.WhiteColor,
                      ButtonColor: ColorCollections.SecondaryColor,
                      ButtonText: 'After the end',
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/exam_started_page');
                },
                child: Container(
                  height: 40,
                  width: 150,
                  margin: const EdgeInsets.only(left: 80, bottom: 20, top: 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/Images/ButtonColor.jpg'),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 28,
                        color: ColorCollections.WhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
