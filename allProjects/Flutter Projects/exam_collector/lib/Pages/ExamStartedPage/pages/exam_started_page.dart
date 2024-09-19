import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:exam_collector/Models/EXAM_QUESTION_MODEL.dart';
import 'package:flutter/material.dart';

class exam_started_page extends StatelessWidget {
  const exam_started_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: AppBar(
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
            ReusableText(
              TextString: '1:48',
              FontSize: 18,
              TextColor: ColorCollections.SecondaryColor,
              TextFontWeight: FontWeight.w500,
            ),
            ReusableText(
              TextString: 'Stop',
              FontSize: 18,
              TextColor: ColorCollections.RedColor,
              TextFontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                height: 290,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EXAM_QUESTION_MODEL(
                      EXAM_QUESTION: 'What is my name ? What do you think ?',
                      EXAM_QUESTION_CHOICE_A: 'A. I DONT KNOW',
                      EXAM_QUESTION_CHOICE_B: 'B.YARED',
                      EXAM_QUESTION_CHOICE_C: 'C.DEREJE',
                      EXAM_QUESTION_CHOICE_D: 'D.DEJENE',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 230, left: 15, right: 18),
                child: ExpansionTile(
                  backgroundColor: Colors.amber.shade100,
                  onExpansionChanged: (value) {},
                  title: Text('Explanation'),
                  children: [
                    Text('data'),
                    Text('data'),
                    Text('data'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          left: 20,
          bottom: 15,
        ),
        height: 60,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            Navigator.of(context).pushNamed('/result_page');
          },
          child: Text('Finished'),
        ),
      ),
    );
  }
}
