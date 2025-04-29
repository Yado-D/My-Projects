import 'package:exam_collector_admin_app/utils/AppColorCollections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget PostReusableTextField({
  required BuildContext context,
  required String icon_name,
  String suffix_icon_name = '',
  required String hintText,
  required String textType,
  void Function(String values)? onchange,
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
          margin: EdgeInsets.only(left: 17),
          child: Image.asset(
            "assets/icons/$icon_name.png",
            color: ColorCollections.SecondaryColor,
          ),
        ),
        SizedBox(
          height: 50.h,
          width: 200.h,
          child: TextField(
            onChanged: (value) => onchange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              // suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
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
            margin: EdgeInsets.only(left: 17),
            child: Image.asset("assets/icons/$suffix_icon_name.png"),
          ),
      ],
    ),
  );
}
