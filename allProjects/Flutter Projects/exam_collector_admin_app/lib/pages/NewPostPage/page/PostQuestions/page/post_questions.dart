import 'package:exam_collector_admin_app/pages/NewPostPage/page/PostQuestions/widgets/all_post_page_widget.dart';
import 'package:exam_collector_admin_app/utils/AppColorCollections.dart';
import 'package:exam_collector_admin_app/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class postQuestions extends StatelessWidget {
  const postQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: ListView(
        children: [
          Container(
            height: 105,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorCollections.WhiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReusableText(
                  TextFontWeight: FontWeight.w900,
                  TextColor: ColorCollections.SecondaryColor,
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: 'Fill the form',
                  FontSize: 35,
                ),
                ReusableText(
                  TextColor: ColorCollections.SecondaryColor,
                  FromTop: 0,
                  TextString: 'Correctly',
                  FontSize: 35,
                )
              ],
            ),
          ),
          Center(
            child: PostReusableTextField(
              context: context,
              FromTop: 30,
              icon_name: 'file-text',
              hintText: 'subject name',
              textType: 'question',
            ),
          ),
          Center(
            child: PostReusableTextField(
              context: context,
              FromTop: 30,
              icon_name: 'edit',
              hintText: 'year',
              textType: 'year',
            ),
          ),
          SizedBox(
            height: 250,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/type_questions_page');
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
