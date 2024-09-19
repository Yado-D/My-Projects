import 'package:exam_collector_admin_app/pages/NewPostPage/page/PostQuestions/widgets/all_post_page_widget.dart';
import 'package:exam_collector_admin_app/utils/AppColorCollections.dart';
import 'package:exam_collector_admin_app/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class TypeQuestionsPage extends StatelessWidget {
  const TypeQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ReusableText(
                    TextFontWeight: FontWeight.w900,
                    TextColor: ColorCollections.SecondaryColor,
                    FromTop: 10,
                    FromBottom: 0,
                    TextString: 'Type Exam Questions',
                    FontSize: 35,
                  ),
                ),
                ReusableText(
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.SecondaryColor,
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Question',
                  FontSize: 16,
                ),
                PostReusableTextField(
                  context: context,
                  FromTop: 0,
                  icon_name: 'file-text',
                  hintText: 'question',
                  textType: 'question',
                  onchange: (value) {
                    print(value);
                  },
                ),
                ReusableText(
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.SecondaryColor,
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Choice A',
                  FontSize: 16,
                ),
                PostReusableTextField(
                  context: context,
                  FromTop: 0,
                  icon_name: 'file-text',
                  hintText: 'Choice A',
                  textType: 'question',
                  onchange: (value) {
                    print(value);
                  },
                ),
                ReusableText(
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.SecondaryColor,
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Choice B',
                  FontSize: 16,
                ),
                PostReusableTextField(
                  context: context,
                  FromTop: 0,
                  icon_name: 'file-text',
                  hintText: 'Choice B',
                  textType: 'question',
                  onchange: (value) {
                    print(value);
                  },
                ),
                ReusableText(
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.SecondaryColor,
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Choice C',
                  FontSize: 16,
                ),
                PostReusableTextField(
                  context: context,
                  FromTop: 0,
                  icon_name: 'file-text',
                  hintText: 'Choice C',
                  textType: 'question',
                  onchange: (value) {
                    print(value);
                  },
                ),
                ReusableText(
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.SecondaryColor,
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Choice D',
                  FontSize: 16,
                ),
                PostReusableTextField(
                  context: context,
                  FromTop: 0,
                  icon_name: 'file-text',
                  hintText: 'Choice D',
                  textType: 'question',
                  onchange: (value) {
                    print(value);
                  },
                ),
                ReusableText(
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.SecondaryColor,
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Choice E',
                  FontSize: 16,
                ),
                PostReusableTextField(
                  context: context,
                  FromTop: 0,
                  icon_name: 'file-text',
                  hintText: 'Choice E',
                  textType: 'question',
                  onchange: (value) {
                    print(value);
                  },
                ),
                ReusableText(
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.SecondaryColor,
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Choice F',
                  FontSize: 16,
                ),
                PostReusableTextField(
                  context: context,
                  FromTop: 0,
                  icon_name: 'file-text',
                  hintText: 'Choice F',
                  textType: 'question',
                  onchange: (value) {
                    print(value);
                  },
                ),
                ReusableText(
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.SecondaryColor,
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Explanation',
                  FontSize: 16,
                ),
                PostReusableTextField(
                  context: context,
                  FromTop: 0,
                  icon_name: 'file-text',
                  hintText: 'Explanation',
                  textType: 'question',
                  onchange: (value) {
                    print(value);
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).pushNamed('/type_questions_page');
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
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: ReusableText(
                              TextString: 'ADD',
                              FontSize: 20,
                              TextColor: ColorCollections.WhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/result_page');
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
                              TextString: 'SUBMIT',
                              FontSize: 20,
                              TextColor: ColorCollections.WhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
