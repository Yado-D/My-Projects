import 'package:exam_collector_admin_app/Pages/SignInPage/Bloc/SignInBloc.dart';
import 'package:exam_collector_admin_app/pages/SignInPage/Bloc/signInBlocEvent.dart';
import 'package:exam_collector_admin_app/utils/AppColorCollections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//this is for the page that need the shaped container

class FullPageContainer extends StatelessWidget {
  const FullPageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
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
//common app bar



AppBar SimpleAppBars(BuildContext context,bool haveArrowBack, String title, {bool? isDescription = false} ){
  return AppBar(

    backgroundColor: ColorCollections.PrimaryColor,
    automaticallyImplyLeading: false,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color.fromARGB(255, 203, 203, 203),
            width: 1.0,
          ),
        ),
      ),
      height: 90,
      padding: EdgeInsets.only(top: 30, left: 0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          haveArrowBack ? Container(
            margin: EdgeInsets.only(left: 8,bottom: 30,top: 10),
            child: IconButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pushNamed('/home_page');
                }
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 26,
                color: Color(0xFF003540),
              ),
            ),
          ):SizedBox(),
          Center(
            child: FittedBox(
              child: ReusableText(
                FromLeft: 40,
                FromRight: 30,
                TextString: title,
                FontSize: 26,
                TextColor: Color(0xFF003540),
                TextFontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
    // actions: [
    //   isDescription == true
    //       ? InkWell(
    //     onTap: () {
    //       Navigator.of(context).pushAndRemoveUntil(
    //           MaterialPageRoute(
    //             builder: (context) => home_page(),
    //           ),
    //               (predicate) => false);
    //     },
    //     child: Container(
    //       margin: EdgeInsets.only(right: 15,bottom: 10),
    //       child: Icon(
    //         Icons.cancel,
    //         size: 26,
    //         color: Colors.black,
    //       ),
    //     ),
    //   )
    //       : SizedBox(),
    // ],
  );
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
        boxShadow: [
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
          child: Image.asset("assets/icons/$icon_name.png"),
        ),
        SizedBox(
          height: 50.h,
          width: widthOfTextField.h,
          child: TextField(
            onChanged: (value) {
              if (textType == 'Email') {
                context.read<SignInBloc>().add(EmailEvent(value));
              } else if (textType == 'Password') {
                context.read<SignInBloc>().add(PasswordEvent(value));
              } else {
                print('error');
              }
            },
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
