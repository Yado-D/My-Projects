import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage3/Bloc/WelcomePage3Bloc.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage3/Bloc/WelcomePage3BlocEvent.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage3/Bloc/WelcomePage3BlocState.dart';
import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/AllCommonWidget.dart';

class WelcomePage3 extends StatelessWidget {
  const WelcomePage3({super.key});

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
                  TextString: 'Your Position ?',
                  FontSize: 48,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<Welcomepage3bloc, Welcomepage3blocstate>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<Welcomepage3bloc>().add(
                                PositionButtonClikedEvent(
                                    PositionButtonCliked: 'freshman'),
                              );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 90, top: 40),
                          child: AppButton(
                            ButtonHeight: 50,
                            ButtonWidth: 200,
                            ContainerColor:
                                state.copyWith().PositionButtonClicked ==
                                        'freshman'
                                    ? ColorCollections.SecondaryColor
                                    : ColorCollections.WhiteColor,
                            ButtonText: 'Freshman',
                            ButtonFontWeight: FontWeight.bold,
                            FontSize: 30,
                            ButtonColor:
                                state.copyWith().PositionButtonClicked ==
                                        'freshman'
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
                          context.read<Welcomepage3bloc>().add(
                              PositionButtonClikedEvent(
                                  PositionButtonCliked: "bsc"));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 90),
                          child: AppButton(
                            ButtonHeight: 50,
                            ButtonWidth: 200,
                            ContainerColor:
                                state.copyWith().PositionButtonClicked == 'bsc'
                                    ? ColorCollections.SecondaryColor
                                    : ColorCollections.WhiteColor,
                            ButtonText: 'BSC',
                            ButtonFontWeight: FontWeight.bold,
                            FontSize: 30,
                            ButtonColor:
                                state.copyWith().PositionButtonClicked == 'bsc'
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
                          context.read<Welcomepage3bloc>().add(
                              PositionButtonClikedEvent(
                                  PositionButtonCliked: 'masters'));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 90),
                          child: AppButton(
                            ButtonHeight: 50,
                            ButtonWidth: 200,
                            ContainerColor:
                                state.copyWith().PositionButtonClicked ==
                                        'masters'
                                    ? ColorCollections.SecondaryColor
                                    : ColorCollections.WhiteColor,
                            ButtonText: 'Masters',
                            ButtonFontWeight: FontWeight.bold,
                            FontSize: 30,
                            ButtonColor:
                                state.copyWith().PositionButtonClicked ==
                                        'masters'
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
                          context.read<Welcomepage3bloc>().add(
                              PositionButtonClikedEvent(
                                  PositionButtonCliked: "phd"));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 90),
                          child: AppButton(
                            ButtonHeight: 50,
                            ButtonWidth: 200,
                            ContainerColor:
                                state.copyWith().PositionButtonClicked == 'phd'
                                    ? ColorCollections.SecondaryColor
                                    : ColorCollections.WhiteColor,
                            ButtonText: 'PHD',
                            ButtonFontWeight: FontWeight.bold,
                            FontSize: 30,
                            ButtonColor:
                                state.copyWith().PositionButtonClicked == 'phd'
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
                          context.read<Welcomepage3bloc>().add(
                              PositionButtonClikedEvent(
                                  PositionButtonCliked: "none"));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 90),
                          child: AppButton(
                            ButtonHeight: 50,
                            ButtonWidth: 200,
                            ContainerColor:
                                state.copyWith().PositionButtonClicked == 'none'
                                    ? ColorCollections.SecondaryColor
                                    : ColorCollections.WhiteColor,
                            ButtonText: 'None',
                            ButtonFontWeight: FontWeight.bold,
                            FontSize: 30,
                            ButtonColor:
                                state.copyWith().PositionButtonClicked == 'none'
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
                    Navigator.of(context).pushNamed('/welcome_page4');
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    margin: EdgeInsets.only(left: 20, bottom: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
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
