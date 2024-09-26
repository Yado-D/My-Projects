import 'package:exam_collector/Pages/ExamPage/pages/exam_page.dart';
import 'package:exam_collector/Pages/HomePage/widgets/homePageWidget.dart';
import 'package:exam_collector/Pages/searchPage/page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/AppColorCollections.dart';

//this is for the page that need the shaped container

class FullPageContainer extends StatelessWidget {
  const FullPageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/Images/WelcomePageBackgroundImage.jpg'),
        ),
      ),
    );
  }
}

//this is for reusable text

class ReusableText extends StatelessWidget {
  String TextString;
  Color TextColor;
  double FontSize;
  FontWeight TextFontWeight;
  double FromTop;
  double FromLeft;
  double FromRight;
  double FromBottom;

  ReusableText({
    super.key,
    required this.TextString,
    this.TextColor = ColorCollections.TeritiaryColor,
    required this.FontSize,
    this.TextFontWeight = FontWeight.w300,
    this.FromTop = 5,
    this.FromLeft = 5,
    this.FromRight = 5,
    this.FromBottom = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: FromTop,
        left: FromLeft,
        right: FromRight,
        bottom: FromBottom,
      ),
      child: Text(
        TextString,
        overflow: TextOverflow.fade,
        style: TextStyle(
          color: TextColor,
          fontSize: FontSize,
          fontWeight: TextFontWeight,
        ),
      ),
    );
  }
}

//this is for button that we use in the app

class AppButton extends StatelessWidget {
  String ButtonText;
  double ButtonHeight;
  double ButtonWidth;
  FontWeight ButtonFontWeight;
  double FontSize;
  Color ButtonColor;
  Color ContainerColor;
  AppButton({
    super.key,
    required this.ContainerColor,
    required this.ButtonText,
    this.ButtonColor = ColorCollections.PrimaryColor,
    this.ButtonFontWeight = FontWeight.bold,
    this.ButtonHeight = 30,
    this.ButtonWidth = 70,
    this.FontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ButtonHeight,
      width: ButtonWidth,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: ColorCollections.TeritiaryColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(5, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: ContainerColor.withOpacity(1),
      ),
      child: Center(
        child: Text(
          ButtonText,
          style: TextStyle(
            fontWeight: ButtonFontWeight,
            fontSize: FontSize,
            color: ButtonColor,
          ),
        ),
      ),
    );
  }
}

//reusable text field

Widget reusableTextField({
  required String icon_name,
  String suffix_icon_name = '',
  required String hintText,
  required String textType,
  required void Function(String values)? onchange,
  double WidthOfContainer = 200,
  double widthOfTextField = 100,
  double FromTop = 0,
  double FromBottom = 0,
  double FromRight = 0,
  double FromLeft = 0,
}) {
  return Container(
    height: 50.h,
    width: WidthOfContainer.w,
    margin: EdgeInsets.only(
      top: FromTop.w,
      bottom: FromBottom.w,
      left: FromLeft.w,
      right: FromRight.w,
    ),
    decoration: BoxDecoration(
      color: ColorCollections.WhiteColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: ColorCollections.TeritiaryColor),
    ),
    child: Row(
      children: [
        Container(
          height: 16.w,
          width: 16.w,
          margin: const EdgeInsets.only(left: 17),
          child: Image.asset("assets/icons/$icon_name.png"),
        ),
        SizedBox(
          height: 50.h,
          width: widthOfTextField.h,
          child: TextField(
            onChanged: (value) => onchange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              // suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            obscureText: textType == "password" ? true : false,
          ),
        ),
        if (!(suffix_icon_name == ''))
          Container(
            height: 16.w,
            width: 16.w,
            margin: const EdgeInsets.only(left: 17),
            child: Image.asset("assets/icons/$suffix_icon_name.png"),
          ),
      ],
    ),
  );
}

List<Widget> bottomNavBarPages({
  required BuildContext context,
  required String state,
  required int indexOfCarousel,
  required Map<String, dynamic>? alpha,
}) {
  return [
    HomePageWidget(
      context: context,
      state: state,
      ind: indexOfCarousel,
      alpha: alpha,
    ),
    const search_page(),
    const exam_page(),
    CommentPageWidget(),
  ];
}

// these are the bottom bar widgets

Widget CommentPageWidget() {
  return Container(
    height: 100,
    color: Colors.green,
  );
}
