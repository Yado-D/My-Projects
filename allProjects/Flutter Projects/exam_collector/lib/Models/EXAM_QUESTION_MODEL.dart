import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

class EXAM_QUESTION_MODEL extends StatelessWidget {
  String EXAM_QUESTION;
  String EXAM_QUESTION_CHOICE_A;
  String EXAM_QUESTION_CHOICE_B;
  String EXAM_QUESTION_CHOICE_C;
  String EXAM_QUESTION_CHOICE_D;
  // String EXAM_QUESTION_CHOICE_E;
  // String EXAM_QUESTION_CHOICE_F;

  EXAM_QUESTION_MODEL({
    required this.EXAM_QUESTION,
    required this.EXAM_QUESTION_CHOICE_A,
    required this.EXAM_QUESTION_CHOICE_B,
    required this.EXAM_QUESTION_CHOICE_C,
    required this.EXAM_QUESTION_CHOICE_D,
    // this.EXAM_QUESTION_CHOICE_E = '',
    // this.EXAM_QUESTION_CHOICE_F = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
          child: ReusableText(
            TextString: EXAM_QUESTION,
            FontSize: 18,
            TextFontWeight: FontWeight.w700,
            TextColor: ColorCollections.SecondaryColor,
          ),
        ),
        ExamQuestionText(
          examchoice: EXAM_QUESTION_CHOICE_A,
          checkIconName: 'cancel',
          ontap: () {},
        ),
        ExamQuestionText(
          examchoice: EXAM_QUESTION_CHOICE_B,
          checkIconName: 'cancel',
          ontap: () {},
        ),
        ExamQuestionText(
          examchoice: EXAM_QUESTION_CHOICE_C,
          checkIconName: 'cancel',
          ontap: () {},
        ),
        ExamQuestionText(
          examchoice: EXAM_QUESTION_CHOICE_D,
          checkIconName: 'check',
          ontap: () {},
        ),
        // Container(
        //   margin: EdgeInsets.only(
        //     left: 10,
        //     right: 10,
        //   ),
        //   child: ReusableText(
        //     TextString: EXAM_QUESTION_CHOICE_E,
        //     FontSize: 18,
        //     TextFontWeight: FontWeight.w700,
        //     TextColor: ColorCollections.SecondaryColor,
        //   ),
        // ),
        // Container(
        //   margin: EdgeInsets.only(
        //     left: 10,
        //     right: 10,
        //   ),
        //   child: ReusableText(
        //     TextString: EXAM_QUESTION_CHOICE_F,
        //     FontSize: 18,
        //     TextFontWeight: FontWeight.w700,
        //     TextColor: ColorCollections.SecondaryColor,
        //   ),
        // ),
      ],
    );
  }

  Widget CheckAnswers({required String checkIconName}) {
    return Container(
      margin: const EdgeInsets.only(right: 40),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: checkIconName == 'check' ? Colors.blue : Colors.red,
      ),
      child: Center(
        child: Image.asset(
          'assets/icons/$checkIconName.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget ExamQuestionText({
    required String checkIconName,
    required VoidCallback ontap,
    required String examchoice,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: ReusableText(
              TextString: examchoice,
              FontSize: 18,
              TextFontWeight: FontWeight.w700,
              TextColor: ColorCollections.SecondaryColor,
            ),
          ),
          CheckAnswers(checkIconName: checkIconName),
        ],
      ),
    );
  }
}
