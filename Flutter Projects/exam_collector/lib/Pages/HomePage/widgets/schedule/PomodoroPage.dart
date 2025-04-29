import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroTimerPage extends StatefulWidget {
  @override
  _PomodoroTimerPageState createState() => _PomodoroTimerPageState();
}

class _PomodoroTimerPageState extends State<PomodoroTimerPage> {
  static const int pomodoroDuration = 25 * 60; // 25 minutes
  static const int breakDuration = 5 * 60; // 5 minutes

  int remainingTime = pomodoroDuration;
  bool isWorking = true;
  Timer? timer;

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          isWorking = !isWorking;
          remainingTime = isWorking ? pomodoroDuration : breakDuration;
        }
      });
    });
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      remainingTime = pomodoroDuration;
      isWorking = true;
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: SimpleAppBars(context, 'Pomodoro Timer'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              TextString: 'Enter the Task',
              FontSize: 20,
              TextColor: Colors.black,
              TextFontWeight: FontWeight.w500,
            ),
            reusableTextField(
              widthOfTextField: MediaQuery.of(context).size.width - 150,
              WidthOfContainer: MediaQuery.of(context).size.width - 50,
              hintText: 'Enter the task',
              textType: 'textType',
              onchange: (onchange) {},
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                width: MediaQuery.of(context).size.width - 50,
               height: 300,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(color: Colors.black),
               ),
               child: Column(
                 children: [
                   Center(
                     child: ReusableText(
                       FromTop: 20,
                       TextString: isWorking ? 'Work Session' : 'Break Time',
                       FontSize: 30,
                       TextFontWeight: FontWeight.w500,
                       TextColor: Colors.black,
                     ),
                   ),
                   SizedBox(height: 20),
                   Center(
                     child: ReusableText(
                       TextString: formatTime(remainingTime),
                       FontSize: 49,
                       TextColor: ColorCollections.TextColor,
                       TextFontWeight: FontWeight.w900,
                     ),
                   ),
                   SizedBox(height: 20),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       InkWell(
                         onTap: () {
                           showTimerDialog();
                           startTimer();
                         },
                         child: Container(
                           height: 55,
                           width: 130,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: ColorCollections.TextColor,
                           ),
                           child: Center(
                             child: ReusableText(
                               TextString: 'Start',
                               FontSize: 20,
                               TextColor: ColorCollections.WhiteColor,
                               TextFontWeight: FontWeight.w500,
                             ),
                           ),
                         ),
                       ),
                       SizedBox(width: 10),
                       InkWell(
                         onTap: resetTimer,
                         child: Container(
                           height: 55,
                           width: 130,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: ColorCollections.TextColor),
                           child: Center(
                             child: ReusableText(
                               TextString: 'Reset',
                               FontSize: 20,
                               TextColor: ColorCollections.WhiteColor,
                               TextFontWeight: FontWeight.w500,
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 20),
                 ],
               ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showTimerDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            timer?.cancel();
            timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
              setState(() {
                if (remainingTime > 0) {
                  remainingTime--;
                } else {
                  isWorking = !isWorking;
                  remainingTime = isWorking ? pomodoroDuration : breakDuration;
                }
              });
              setStateDialog(() {}); // Ensure dialog content updates
            });

            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: ColorCollections.PrimaryColor,
                  // style: BorderStyle.values(),
                ),
              ),
              children: [
                Center(
                  child: ReusableText(
                    FromTop: 20,
                    TextString: 'Keep up!',
                    FontSize: 30,
                    TextFontWeight: FontWeight.w500,
                    TextColor: Colors.black,
                  ),
                ),
                Center(
                  child: ReusableText(
                    TextString: 'Task not finished!',
                    FontSize: 30,
                    TextFontWeight: FontWeight.w500,
                    TextColor: Colors.black,
                  ),
                ),
                Container(
                  height: 60,
                  width: 150,
                  child: FittedBox(
                    child: Container(
                      // height: 60,
                      // width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorCollections.GreyColor),
                      child: Center(
                        child: ReusableText(
                          FromTop: 20,
                          TextString: formatTime(remainingTime),
                          FontSize: 40,
                          TextFontWeight: FontWeight.w500,
                          TextColor: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  child: InkWell(
                    onTap: () {
                      resetTimer();
                      Navigator.pop(context);
                    },
                    child: FittedBox(
                      child: Container(
                        height: 55,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorCollections.RedColor),
                        child: Center(
                          child: ReusableText(
                            TextString: 'Cancel',
                            FontSize: 20,
                            TextColor: ColorCollections.WhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
