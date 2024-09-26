import 'package:exam_collector/Pages/SignInPage/Bloc/SignInBloc.dart';
import 'package:exam_collector/Pages/SignInPage/Bloc/signInBlocEvent.dart';
import 'package:exam_collector/Pages/SignInPage/Page/signInController.dart';
import 'package:exam_collector/Pages/SignInPage/Page/signInProgressIndicatorValue.dart';
import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.GreyColor,
      body: ListView(
        children: [
          Stack(
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
                        FromTop: 30,
                        FromLeft: 150,
                        TextString: 'Log In',
                        FontSize: 40,
                        TextColor: ColorCollections.SecondaryColor,
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
                          onchange: (value) => context
                              .read<SignInBloc>()
                              .add(EmailEvent(value))),
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
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        },
                      ),
                      Row(
                        children: [
                          ReusableText(
                            TextString: 'Don\'t have an account ?',
                            FontSize: 15,
                            FromTop: 15,
                            FromLeft: 70,
                            TextColor: ColorCollections.SecondaryColor,
                            TextFontWeight: FontWeight.bold,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/sign_up_page');
                            },
                            child: ReusableText(
                              TextString: 'Sign Up',
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
                          signinProgressIndicator.SignInProgressIndicator =
                              true;
                        });

                        await SigninController(context: context)
                            .handleLogin('email');
                        //
                        setState(() {
                          signinProgressIndicator.SignInProgressIndicator =
                              false;
                        });
                        // Navigator.of(context).pushNamed('/premium_page');
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
                            'Log In',
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
              signinProgressIndicator.SignInProgressIndicator
                  ? Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorCollections.SecondaryColor,
                            borderRadius: BorderRadius.circular(7)),
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.symmetric(vertical: 400),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
