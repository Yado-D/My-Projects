import 'package:flutter/material.dart';

import '../../../../utils/AppColorCollections.dart';
import '../../../../widgets/AllCommonWidget.dart';
import '../widget/WelcomePage4Widget.dart';

class Welcomepage4 extends StatelessWidget {
  const Welcomepage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FullPageContainer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 88,
                child: ReusableText(
                  FromTop: 30,
                  FromLeft: 30,
                  TextString: 'Please Choose',
                  FontSize: 48,
                  FromBottom: 0,
                  TextFontWeight: FontWeight.bold,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
              SizedBox(
                height: 67,
                child: ReusableText(
                  FromLeft: 30,
                  FromTop: 0,
                  TextString: 'Your University ?',
                  FontSize: 48,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
              DropDownButton(context, 90),
            ],
          ),
          Positioned(
            bottom: 1,
            child: Column(
              children: [
                ReusableText(
                  FromLeft: 50,
                  FromTop: 0,
                  FromBottom: 80,
                  TextString: 'Run To The Next',
                  FontSize: 40,
                  TextColor: ColorCollections.WhiteColor,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/sign_in_page');
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    margin: EdgeInsets.only(left: 20, bottom: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
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
        ],
      ),
    );
  }
}
