import 'package:exam_collector_admin_app/utils/AppColorCollections.dart';
import 'package:exam_collector_admin_app/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReusableText(
            FromLeft: 70,
            FromTop: 30,
            FromBottom: 150,
            TextColor: ColorCollections.SecondaryColor,
            TextFontWeight: FontWeight.w900,
            TextString: 'Admin Page',
            FontSize: 48,
          ),
          homeContainer(
            text: 'Permissions',
            ontap: () {
              Navigator.of(context).pushNamed('/permission_page');
            },
          ),
          homeContainer(
            text: 'New Post',
            ontap: () {
              Navigator.of(context).pushNamed('/post_page');
            },
          ),
          homeContainer(
            text: 'User Info',
            ontap: () {
              Navigator.of(context).pushNamed('/user_info_page');
            },
          ),
        ],
      ),
    );
  }

  Widget homeContainer({
    required String text,
    required void Function() ontap,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
          left: 120,
          bottom: 15,
        ),
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: ColorCollections.SecondaryColor),
          color: ColorCollections.WhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: ReusableText(
            TextColor: ColorCollections.SecondaryColor,
            TextString: text,
            FontSize: 24,
          ),
        ),
      ),
    );
  }
}
