import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

class account_page extends StatelessWidget {
  final Map<String, dynamic>? alpha;
  const account_page({
    this.alpha,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FullPageContainer(),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  TextString: 'Accounts',
                  FontSize: 55,
                  FromTop: 20,
                  FromLeft: 40,
                  TextFontWeight: FontWeight.w900,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.person_add_alt_1,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                    ReusableText(
                      TextString: 'Upload a photo',
                      FontSize: 17,
                      TextColor: Colors.blue,
                      TextFontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                accountTexts(
                  title: 'Name :',
                  text: alpha!['userName'],
                ),
                accountTexts(
                  title: 'Email :',
                  text: alpha!['userEmail'],
                ),
                accountTexts(
                  title: 'Phone :',
                  text: alpha!['userPhone'],
                ),
                accountTexts(
                  title: 'Crrent status :',
                  text: alpha!['userCurrentStatus'],
                ),
                accountTexts(
                  title: 'University :',
                  text: alpha!['userUniversity'],
                ),
                accountTexts(
                  title: 'Level :',
                  text: alpha!['userEducationLevel'],
                ),
                accountTexts(
                  title: 'Plan :',
                  text: alpha!['userType'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget accountTexts({
    required String text,
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 0, right: 0),
      child: Row(
        children: [
          ReusableText(
            TextString: title,
            FromRight: 40,
            FontSize: 20,
            FromTop: 0,
            FromBottom: 0,
            TextFontWeight: FontWeight.bold,
            TextColor: ColorCollections.SecondaryColor,
          ),
          ReusableText(
            TextString: text,
            FontSize: 20,
            FromTop: 0,
            FromBottom: 0,
            TextFontWeight: FontWeight.w500,
            TextColor: ColorCollections.SecondaryColor,
          ),
        ],
      ),
    );
  }
}
