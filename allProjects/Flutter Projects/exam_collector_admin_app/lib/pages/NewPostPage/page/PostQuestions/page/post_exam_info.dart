import 'package:exam_collector_admin_app/pages/NewPostPage/page/PostQuestions/page/post_image_of_exam.dart';
import 'package:exam_collector_admin_app/pages/NewPostPage/page/PostQuestions/widgets/all_post_page_widget.dart';
import 'package:exam_collector_admin_app/utils/AppColorCollections.dart';
import 'package:exam_collector_admin_app/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class postExamInfo extends StatefulWidget {
  const postExamInfo({super.key});

  @override
  State<postExamInfo> createState() => _postExamInfoState();
}

class _postExamInfoState extends State<postExamInfo> {
  String subjectName = "";
  String universityName = "";
  String year = "";
  String department = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, true, 'Post Question Image'),
      backgroundColor: ColorCollections.PrimaryColor,
      body: ListView(
        children: [
          Center(
            child: PostReusableTextField(
              context: context,
              FromTop: 30,
              widthOfTextField: 200,
              WidthOfContainer: 250,
              icon_name: 'file-text',
              hintText: 'subject name',
              textType: 'question',
                onchange: (onchange){
                   setState(() {
                     subjectName = onchange.trim();
                   });
                }
            ),
          ),
          Center(
            child: PostReusableTextField(
              context: context,
              FromTop: 30,
              widthOfTextField: 200,
              WidthOfContainer: 250,
              icon_name: 'file-text',
              hintText: 'University name',
              textType: 'question',
                onchange: (onchange){
                setState(() {
                  universityName = onchange.trim();

                });
                }
            ),
          ),
          Center(
            child: PostReusableTextField(
                widthOfTextField: 200,
                WidthOfContainer: 250,
                context: context,
                FromTop: 30,
                icon_name: 'edit',
                hintText: 'department',
                textType: 'department',
                onchange: (onchange){
                  setState(() {
                    department = onchange.trim();
                  });
                }
            ),
          ),
          Center(
            child: PostReusableTextField(
              widthOfTextField: 200,
              WidthOfContainer: 250,
              context: context,
              FromTop: 30,
              icon_name: 'edit',
              hintText: 'year',
              textType: 'year',
              onchange: (onchange){
                setState(() {
                  year = onchange.trim();
                });
              }
            ),
          ),
          SizedBox(
            height: 250,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>postExamImagePage(
                   subjectName: subjectName,
                    universityName: universityName,
                    department: department,
                    year: year,
                   ),
                ),
              );
              // commonSnackBar(context, 'Successfully done the operation');
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(right: 30),
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      offset: Offset(5, 5),
                      color: ColorCollections.TeritiaryColor,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                  color: Colors.red.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: ReusableText(
                    TextString: 'Check',
                    FontSize: 20,
                    TextColor: ColorCollections.WhiteColor,
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
