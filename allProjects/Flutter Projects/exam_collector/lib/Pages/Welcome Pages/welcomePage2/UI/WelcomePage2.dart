import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage2/Bloc/welcomePage2Bloc.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage2/Bloc/welcomePage2BlocEvent.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage2/Bloc/welcomePage2BlocState.dart';
import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/AllCommonWidget.dart';

class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const FullPageContainer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 88,
                child: ReusableText(
                  FromTop: 30,
                  FromLeft: 30,
                  TextString: 'Please Choose',
                  FontSize: 48,
                  FromBottom: 0,
                  TextFontWeight: FontWeight.bold,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
              SizedBox(
                height: 56,
                child: ReusableText(
                  FromLeft: 30,
                  FromTop: 0,
                  TextString: 'Are You ?',
                  FontSize: 48,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<WelcomePage2Bloc, WelcomePage2State>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<WelcomePage2Bloc>().add(
                                textButtonClikedEvent(
                                    textButtonCliked: 'student'),
                              );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 90, top: 40),
                          child: AppButton(
                            ButtonHeight: 50,
                            ButtonWidth: 180,
                            ContainerColor:
                                state.copyWith().textButtonCliked == 'student'
                                    ? ColorCollections.SecondaryColor
                                    : ColorCollections.WhiteColor,
                            ButtonText: 'Student',
                            ButtonFontWeight: FontWeight.bold,
                            FontSize: 30,
                            ButtonColor:
                                state.copyWith().textButtonCliked == 'student'
                                    ? ColorCollections.WhiteColor
                                    : ColorCollections.SecondaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          context.read<WelcomePage2Bloc>().add(
                                textButtonClikedEvent(
                                    textButtonCliked: 'teacher'),
                              );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 90),
                          child: AppButton(
                            ButtonHeight: 50,
                            ButtonWidth: 180,
                            ContainerColor:
                                state.copyWith().textButtonCliked == 'teacher'
                                    ? ColorCollections.SecondaryColor
                                    : ColorCollections.WhiteColor,
                            ButtonText: 'Teacher',
                            ButtonFontWeight: FontWeight.bold,
                            FontSize: 30,
                            ButtonColor:
                                state.copyWith().textButtonCliked == 'teacher'
                                    ? ColorCollections.WhiteColor
                                    : ColorCollections.SecondaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          context.read<WelcomePage2Bloc>().add(
                                textButtonClikedEvent(
                                    textButtonCliked: 'other'),
                              );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 90),
                          child: AppButton(
                            ButtonHeight: 50,
                            ButtonWidth: 180,
                            ContainerColor:
                                state.copyWith().textButtonCliked == 'other'
                                    ? ColorCollections.SecondaryColor
                                    : ColorCollections.WhiteColor,
                            ButtonText: 'Other',
                            ButtonFontWeight: FontWeight.bold,
                            FontSize: 30,
                            ButtonColor:
                                state.copyWith().textButtonCliked == 'other'
                                    ? ColorCollections.WhiteColor
                                    : ColorCollections.SecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 1,
            child: Column(
              children: [
                ReusableText(
                  FromLeft: 50,
                  FromTop: 0,
                  FromBottom: 80,
                  TextString: 'Run To The Next',
                  FontSize: 40,
                  TextColor: ColorCollections.WhiteColor,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/welcome_page3');
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
                        'Next',
                        style: TextStyle(
                          fontSize: 28,
                          color: ColorCollections.WhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
