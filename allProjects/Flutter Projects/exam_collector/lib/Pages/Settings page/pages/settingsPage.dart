import 'package:exam_collector/auth/GetUserDetails.dart';
import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../SignInPage/Bloc/SignInBloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: Stack(
        children: [
          const FullPageContainer(),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  TextString: 'Settings',
                  FontSize: 55,
                  FromTop: 20,
                  FromLeft: 40,
                  TextFontWeight: FontWeight.w900,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                ReusableText(
                  TextString: 'Account',
                  FontSize: 25,
                  FromTop: 10,
                  FromLeft: 0,
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                settingRowWidget(
                  ontap: () async {
                    final state = context.read<SignInBloc>().state;
                    String emailAddress = state.email;
                    Map<String, dynamic> alpha =
                        await Getuserdetails(email: emailAddress).userMap();
                    Navigator.of(context)
                        .pushNamed('/account_page', arguments: alpha);
                  },
                  iconData: const Icon(Icons.person),
                  text: 'yared dereje',
                ),
                settingRowWidget(
                  ontap: () {},
                  iconData: const Icon(Icons.lock_open_outlined),
                  text: 'Password',
                ),
                settingRowWidget(
                  ontap: () {},
                  iconData: const Icon(Icons.notifications_active),
                  text: 'Notification',
                ),
                settingRowWidget(
                  ontap: () {},
                  iconData: const Icon(Icons.help),
                  text: 'Help',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget settingRowWidget({
    required Icon iconData,
    required String text,
    required VoidCallback ontap,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            // backgroundColor: ColorCollections.WhiteColor,
            radius: 25,
            child: iconData,
          ),
          ReusableText(
            TextString: text,
            FontSize: 20,
            TextFontWeight: FontWeight.w500,
            TextColor: ColorCollections.SecondaryColor,
          ),
          InkWell(
            onTap: ontap,
            child: Container(
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
