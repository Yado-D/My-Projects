// ignore: must_be_immutable
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_vehicle_app/APIs/simple_vehicle_api_to_firebase.dart';
import 'package:simple_vehicle_app/DashbordPage/main_daashbord_screen.dart';
import 'package:simple_vehicle_app/utils.dart';

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
    this.TextColor = Colors.black87,
    required this.FontSize,
    this.TextFontWeight = FontWeight.w500,
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
        style: GoogleFonts.quicksand(
          color: TextColor,
          fontSize: FontSize,
          fontWeight: TextFontWeight,
        ),
      ),
    );
  }
}

//this is for button that we use in the app

// ignore: must_be_immutable
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
    this.ButtonColor = Colors.blue,
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
            color: Colors.blue,
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

AppBar SimpleAppBars(BuildContext context, String title, {bool? isDescription = false}) {
  return AppBar(
    leading: Container(
      margin: EdgeInsets.only(left: 8,bottom: 15),
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
    ),
    backgroundColor: Colors.grey.shade100,
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
      height: 120,
      padding: EdgeInsets.only(top: 40, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FittedBox(
              child: ReusableText(
                FromLeft: 40,
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
    actions: [
      isDescription == true
          ? InkWell(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MainDashboardPage(),
              ),
                  (predicate) => false);
        },
        child: Container(
          margin: EdgeInsets.only(right: 15,bottom: 10),
          child: Icon(
            Icons.cancel,
            size: 26,
            color: Colors.black87,
          ),
        ),
      )
          : SizedBox(),
    ],
  );
}

Future<void> customEditingShowDialog(BuildContext context, String type, String documentId) {
  String? newVal;

  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 200,
              maxWidth: 350,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromLeft: 10,
                  TextString: type == 'name'
                      ? "New Name"
                      : type == 'fuelLevel'
                      ? "Fuel Level"
                      : "Last Location",
                  FontSize: 18,
                ),
                reusableTextField(
                  FromLeft: 10,
                  FromRight: 10,
                  hintText: type == 'name'
                      ? "Enter new name"
                      : type == 'fuelLevel'
                      ? "Enter fuel level"
                      : "Enter last location",
                  textType: 'text',
                  onchange: (value) {
                    newVal = value;
                  },
                ),
                GestureDetector(
                  onTap: () async {
                    if (newVal == null || newVal!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a value!')),
                      );
                      return;
                    }
                    print(documentId);
                    print(type);
                  String res =   await simple_vehicle_firebase_api().updateSimpleVehicleInfo(
                      documentId,
                      newVal!,
                      type,
                    );
                    print(res);
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: AppButton(
                        ContainerColor: Colors.blue,
                        ButtonText: "Submit",
                        ButtonColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}


Future<void> customAddingShowDialog(BuildContext context) {
  // String? newVal;
  String? name;
  String? location;
  String? fuelLevel;

  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 200,
              maxWidth: 350,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: 150,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("assets/images/fancy-2.jpeg"),
                //       fit: BoxFit.fill,
                //       opacity: 0.1
                //     ),
                //   ),
                //   child: Center(
                //     child: IconButton(
                //         onPressed:onTap,
                //         icon: Icon(Icons.add_a_photo_outlined,),
                //     ),
                //   ),
                // ),
                ReusableText(
                  FromLeft: 10,
                  TextString: 'name',
                  FontSize: 18,
                ),
                reusableTextField(
                  FromLeft: 10,
                  FromRight: 10,
                  hintText:
                      "Enter new name",
                  textType: 'text',
                  onchange: (value) {
                    name = value;
                  },
                ),
                ReusableText(
                  FromLeft: 10,
                  TextString: 'FuelLevel',
                  FontSize: 18,
                ),
                reusableTextField(
                  FromLeft: 10,
                  FromRight: 10,
                  hintText:
                  "Enter fuelLevel",
                  textType: 'text',
                  onchange: (value) {
                    fuelLevel = value;
                  },
                ),
                ReusableText(
                  FromLeft: 10,
                  TextString: 'Location',
                  FontSize: 18,
                ),
                reusableTextField(
                  FromLeft: 10,
                  FromRight: 10,
                  hintText:
                  "Enter new location",
                  textType: 'text',
                  onchange: (value) {
                    location = value;
                  },
                ),
                GestureDetector(
                  onTap: () async {
                    if (name!.isEmpty || fuelLevel!.isEmpty || location!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a value!')),
                      );
                      return;
                    }
                    // print(documentId);
                    // print(type);
                    String res =  await simple_vehicle_firebase_api().addMoreVehicles(name, fuelLevel, location);
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                         backgroundColor: Colors.blue,
                           content: ReusableText(
                             TextColor: Colors.white,
                               TextString: res,
                               FontSize: 20,
                           ),
                       ),
                     );
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: AppButton(
                        ContainerColor: Colors.blue,
                        ButtonText: "Submit",
                        ButtonColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget reusableTextField({
  String? icon_name,
  String suffix_icon_name = '',
  required String hintText,
  required String textType,
  required void Function(String values)? onchange,
  double WidthOfContainer = 300,
  double widthOfTextField = 150,
  double FromTop = 0,
  double FromBottom = 0,
  double FromRight = 0,
  double FromLeft = 0,
}) {
  return Container(
    height: 35.h,
    width: WidthOfContainer.w,
    margin: EdgeInsets.only(
      top: FromTop.w,
      bottom: FromBottom.w,
      left: FromLeft.w,
      right: FromRight.w,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color.fromARGB(255, 192, 190, 190)),
    ),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        icon_name != null
            ? Container(
          height: 16.w,
          width: 16.w,
          margin: const EdgeInsets.only(left: 17),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/flat_icons/$icon_name.png"),
            ),
          ),
        )
            : SizedBox(),
        SizedBox(
          height: 45.h,
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