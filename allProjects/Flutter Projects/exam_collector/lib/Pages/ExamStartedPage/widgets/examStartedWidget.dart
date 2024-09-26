import 'package:exam_collector/Models/EXAM_QUESTION_MODEL.dart';
import 'package:flutter/material.dart';

Widget ExamContainer() {
  return Stack(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
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
        margin: const EdgeInsets.only(top: 230, left: 15, right: 15),
        child: ExpansionTile(
          onExpansionChanged: (value) {},
          title: const Text('Explanation'),
          children: const [
            Text('data'),
            Text('data'),
            Text('data'),
          ],
        ),
      )
    ],
  );
}
