import 'package:exam_collector/Pages/SignUpPage/Bloc/signUpBlocEvent.dart';
import 'package:exam_collector/Pages/SignUpPage/Pages/signUpController.dart';
import 'package:exam_collector/utils/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../Bloc/SignUpBloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    bool loginClicked = false;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              const FullPageContainer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    FromTop: 50,
                    FromLeft: 30,
                    TextString: 'EXAM COLLECTORS',
                    FontSize: 37,
                    TextFontWeight: FontWeight.bold,
                    TextColor: ColorCollections.SecondaryColor,
                  ),
                  ReusableText(
                    FromTop: 20,
                    FromLeft: 150,
                    TextString: 'Sign Up',
                    FontSize: 40,
                    TextColor: ColorCollections.SecondaryColor,
                  ),
                  ReusableText(
                    TextString: 'Name',
                    FontSize: 15,
                    FromTop: 10,
                    FromLeft: 30,
                    TextColor: ColorCollections.SecondaryColor,
                    TextFontWeight: FontWeight.normal,
                  ),
                  reusableTextField(
                    FromLeft: 40,
                    WidthOfContainer: 250,
                    widthOfTextField: 150,
                    icon_name: 'person(1)',
                    hintText: 'Enter your Name',
                    textType: 'Name',
                    onchange: (value) {
                      context.read<SignUpBloc>().add(NameEvent(value));
                    },
                  ),
                  ReusableText(
                    TextString: 'Phone Number',
                    FontSize: 15,
                    FromTop: 10,
                    FromLeft: 30,
                    TextColor: ColorCollections.SecondaryColor,
                    TextFontWeight: FontWeight.normal,
                  ),
                  reusableTextField(
                    FromLeft: 40,
                    WidthOfContainer: 250,
                    widthOfTextField: 150,
                    icon_name: 'person(1)',
                    hintText: 'Enter your phone number',
                    textType: 'phone',
                    onchange: (value) {
                      context.read<SignUpBloc>().add(PhoneEvent(value));
                    },
                  ),
                  ReusableText(
                    TextString: 'Email',
                    FontSize: 15,
                    FromTop: 10,
                    FromLeft: 30,
                    TextColor: ColorCollections.SecondaryColor,
                    TextFontWeight: FontWeight.normal,
                  ),
                  reusableTextField(
                    FromLeft: 40,
                    WidthOfContainer: 250,
                    widthOfTextField: 150,
                    icon_name: 'person(1)',
                    hintText: 'Enter your Email',
                    textType: 'Email',
                    onchange: (value) {
                      if (value == '') {
                        toastInfo(msg: 'email shoul dn\'t be empty.');
                      }
                      context.read<SignUpBloc>().add(EmailEvent(value));
                    },
                  ),
                  ReusableText(
                    TextString: 'Password',
                    FontSize: 15,
                    FromTop: 15,
                    FromLeft: 30,
                    TextColor: ColorCollections.SecondaryColor,
                    TextFontWeight: FontWeight.normal,
                  ),
                  reusableTextField(
                    FromLeft: 40,
                    WidthOfContainer: 250,
                    widthOfTextField: 150,
                    icon_name: 'lock',
                    hintText: 'Enter your password',
                    textType: 'password',
                    onchange: (value) {
                      context.read<SignUpBloc>().add(PasswordEvent(value));
                    },
                  ),
                  Row(
                    children: [
                      ReusableText(
                        TextString: 'Already a member ?',
                        FontSize: 15,
                        FromTop: 20,
                        FromLeft: 70,
                        TextColor: ColorCollections.WhiteColor,
                        TextFontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            '/sign_in_page',
                            (route) => false,
                          );
                        },
                        child: ReusableText(
                          TextString: 'Log In',
                          FontSize: 15,
                          FromTop: 15,
                          TextColor: Colors.blue.shade900,
                          TextFontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 1,
                left: 100,
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      loginClicked = true;
                    });
                    await SignUpController(context: context).handleSignup();
                    setState(() {
                      loginClicked = false;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    margin: const EdgeInsets.only(left: 20, bottom: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/Images/ButtonColor.jpg'),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 28,
                          color: ColorCollections.WhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
