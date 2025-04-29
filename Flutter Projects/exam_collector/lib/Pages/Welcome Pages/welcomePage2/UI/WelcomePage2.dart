import 'package:exam_collector/Pages/Welcome%20Pages/WelcomePageOnlyTeacher/page/CollectTeacherInfo.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage2/Bloc/welcomePage2Bloc.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage2/Bloc/welcomePage2BlocEvent.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage2/Bloc/welcomePage2BlocState.dart';
import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/AllCommonWidget.dart';

class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        backgroundColor: ColorCollections.PageColor,
        body: Stack(
          children: [
            // const FullPageContainer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
                  child: ReusableText(
                    FromTop: 30,
                    FromLeft: 30,
                    TextString: 'Please Choose',
                    FontSize: 40,
                    FromBottom: 0,
                    TextFontWeight: FontWeight.bold,
                    TextColor: ColorCollections.SecondaryColor,
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: ReusableText(
                    FromLeft: 30,
                    FromTop: 0,
                    TextString: 'Are You ?',
                    FontSize: 40,
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
                     mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              context.read<WelcomePage2Bloc>().add(
                                    textButtonClikedEvent(
                                        textButtonCliked: 'student'),
                                  );
                            },
                            child: Container(
                              margin: const EdgeInsets.only( top: 40),
                              child: AppButton(
                                ButtonHeight: 45,
                                ButtonWidth: 180,
                                ContainerColor:
                                    state.copyWith().textButtonCliked == 'student'
                                        ? ColorCollections.SecondaryColor
                                        : ColorCollections.WhiteColor,
                                ButtonText: 'Student',
                                ButtonFontWeight: FontWeight.bold,
                                FontSize: 23,
                                ButtonColor:
                                    state.copyWith().textButtonCliked == 'student'
                                        ? ColorCollections.WhiteColor
                                        : ColorCollections.SecondaryColor,
                              ),
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
                            margin: const EdgeInsets.only(),
                            child: AppButton(
                              ButtonHeight: 45,
                              ButtonWidth: 180,
                              ContainerColor:
                                  state.copyWith().textButtonCliked == 'teacher'
                                      ? ColorCollections.SecondaryColor
                                      : ColorCollections.WhiteColor,
                              ButtonText: 'Teacher',
                              ButtonFontWeight: FontWeight.bold,
                              FontSize: 23,
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
                            margin: const EdgeInsets.only(),
                            child: AppButton(
                              ButtonHeight: 45,
                              ButtonWidth: 180,
                              ContainerColor:
                                  state.copyWith().textButtonCliked == 'other'
                                      ? ColorCollections.SecondaryColor
                                      : ColorCollections.WhiteColor,
                              ButtonText: 'Other',
                              ButtonFontWeight: FontWeight.bold,
                              FontSize: 23,
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
                Center(
                  child: GestureDetector(
                    onTap: () {
                      final state = context.read<WelcomePage2Bloc>().state;
                      String role = state.textButtonCliked;
                      if(role == 'teacher'){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CollectTeacherInfo()));
                      }else{
                        Navigator.of(context).pushNamed('/welcome_page3');
                      }
                    },
                    child: Container(
                      height: 40,
                      // width: 150,
                      margin: EdgeInsets.only(top:300,left: 30,right: 30),
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
                ),
              ],
            ),

          ],

      ),
    );
  }
}
