import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

class search_page extends StatelessWidget {
  const search_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        // margin: EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ColorCollections.SecondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    30,
                  ),
                  bottomRight: Radius.circular(
                    30,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableTextField(
                    FromTop: 70,
                    FromLeft: 40,
                    WidthOfContainer: 250,
                    widthOfTextField: 200,
                    icon_name: 'search',
                    hintText: 'type course name to search',
                    textType: 'course',
                    onchange: (value) {},
                  ),
                ],
              ),
            ),
            ReusableText(
              TextString: 'Recent Search',
              FontSize: 25,
              FromTop: 30,
              FromLeft: 30,
              TextFontWeight: FontWeight.w700,
              TextColor: ColorCollections.SecondaryColor,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                  ),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/retry.png'),
                    ),
                  ),
                ),
                ReusableText(
                  FontSize: 20,
                  TextString: 'Recent Search',
                  FromLeft: 30,
                  TextFontWeight: FontWeight.w700,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
