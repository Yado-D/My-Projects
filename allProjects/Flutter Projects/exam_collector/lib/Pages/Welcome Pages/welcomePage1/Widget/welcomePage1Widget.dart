import 'package:flutter/material.dart';

import '../../../../utils/AppColorCollections.dart';
import '../../../../widgets/AllCommonWidget.dart';

//for bottom text and button

class BottomTextAndButton extends StatelessWidget {
  const BottomTextAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ReusableText(
            TextString: 'This is Exam Collectors App',
            FontSize: 18,
            FromTop: 0,
            FromLeft: 30,
            FromBottom: 0,
            TextColor: ColorCollections.WhiteColor,
          ),
          ReusableText(
            TextString: '& We Have So Many National Exams',
            FontSize: 18,
            FromTop: 0,
            FromBottom: 0,
            FromLeft: 30,
            TextColor: ColorCollections.WhiteColor,
          ),
          ReusableText(
            TextString: 'You Can Get Start Now.',
            FontSize: 18,
            FromTop: 0,
            FromLeft: 30,
            FromBottom: 50,
            TextColor: ColorCollections.WhiteColor,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/welcome_page2');
            },
            child: Container(
              height: 40,
              width: 150,
              margin: const EdgeInsets.only(left: 20, bottom: 40),
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
    );
  }
}
