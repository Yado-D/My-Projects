import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage4/widget/WelcomePage4Widget.dart';
import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

class exam_page extends StatelessWidget {
  const exam_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: Container(
        margin: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              FromTop: 30,
              FromBottom: 0,
              TextString: 'Choose Your',
              FontSize: 48,
              TextFontWeight: FontWeight.w900,
              TextColor: ColorCollections.SecondaryColor,
            ),
            ReusableText(
              FromTop: 0,
              FromBottom: 0,
              TextString: 'University',
              FontSize: 48,
              TextFontWeight: FontWeight.w300,
              TextColor: ColorCollections.SecondaryColor,
            ),
            DropDownButton(context, 30),
            ReusableText(
              FromTop: 30,
              FromBottom: 0,
              TextString: 'Course Name',
              FontSize: 30,
              TextFontWeight: FontWeight.w400,
              TextColor: ColorCollections.SecondaryColor,
            ),
            reusableTextField(
              FromTop: 20,
              FromLeft: 40,
              WidthOfContainer: 250,
              widthOfTextField: 200,
              icon_name: 'search',
              hintText: 'choose your course',
              textType: 'course',
              onchange: (value) {},
            ),
            ReusableText(
              FromTop: 30,
              FromBottom: 0,
              TextString: 'Course Year',
              FontSize: 30,
              TextFontWeight: FontWeight.w400,
              TextColor: ColorCollections.SecondaryColor,
            ),
            reusableTextField(
              FromTop: 20,
              FromLeft: 40,
              WidthOfContainer: 250,
              widthOfTextField: 200,
              icon_name: 'search',
              hintText: 'choose course year',
              textType: 'course',
              onchange: (value) {},
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/exam_starting_page');
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
          ],
        ),
      ),
    );
  }
}
