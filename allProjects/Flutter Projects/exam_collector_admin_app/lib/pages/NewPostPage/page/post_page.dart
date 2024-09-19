import 'package:exam_collector_admin_app/utils/AppColorCollections.dart';
import 'package:exam_collector_admin_app/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class new_post extends StatelessWidget {
  const new_post({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReusableText(
            FromLeft: 140,
            TextColor: ColorCollections.SecondaryColor,
            TextFontWeight: FontWeight.w900,
            TextString: 'Which Post  ?',
            FontSize: 48,
          ),
          postWidget(
            text: 'Carousel Slider Image',
            ontap: () {
              Navigator.of(context).pushNamed('/carousel_page');
            },
          ),
          postWidget(
            text: 'SliverGrid View Image',
            ontap: () {
              Navigator.of(context).pushNamed('/sliver_grid_page');
            },
          ),
          postWidget(
            text: 'Post Questions',
            ontap: () {
              Navigator.of(context).pushNamed('/post_quesion_page');
            },
          ),
          postWidget(
            text: 'Edit Questions',
            ontap: () {},
          ),
        ],
      ),
    );
  }

  Widget postWidget({
    required String text,
    required void Function() ontap,
  }) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 70,
        width: 250,
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: ColorCollections.WhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: ReusableText(
            TextColor: ColorCollections.SecondaryColor,
            TextString: text,
            FontSize: 30,
          ),
        ),
      ),
    );
  }
}
