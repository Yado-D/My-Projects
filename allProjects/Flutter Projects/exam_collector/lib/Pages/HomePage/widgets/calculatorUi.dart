import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class calculatorUi extends StatefulWidget {
  const calculatorUi({super.key});

  @override
  State<calculatorUi> createState() => _calculatorUiState();
}

class _calculatorUiState extends State<calculatorUi> {
  int subNum = 3;
  double result = 0;
  List<int> crHrs = [4, 4, 4];
  List<String> grades = ['A', 'A','A'];
  int totalCreditHours = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateTotalCreditHours();
  }

  void updateTotalCreditHours() {
     totalCreditHours = 0;
    for(int i= 0;i<crHrs.length;i++){
      totalCreditHours+=crHrs[i];
      print(totalCreditHours);
    }
    setState(() {

    });
  }

  void addSubject() {
    setState(() {
      subNum++;
      crHrs.add(4); // Default credit hour is 4
      grades.add('A'); // Default grade is 'A'
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
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
              size: 23,
              color: ColorCollections.WhiteColor,
            ),
          ),
        ),
        backgroundColor: ColorCollections.TextColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            // border: Border(
            //   bottom: BorderSide(
            //     color: const Color.fromARGB(255, 203, 203, 203),
            //     width: 1.0,
            //   ),
            // ),
          ),
          height: 120,
          padding: EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: FittedBox(
                  child: ReusableText(
                    FromLeft: 20,
                    TextString: 'GPA Calculator',
                    FontSize: 20,
                    TextColor: ColorCollections.WhiteColor,
                    TextFontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 150,
            color: ColorCollections.TextColor,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableText(
                    TextString: 'Your GPA is',
                    FontSize: 20,
                    TextColor: ColorCollections.WhiteColor,
                    TextFontWeight: FontWeight.bold,
                  ),
                  ReusableText(
                    TextColor: ColorCollections.WhiteColor,
                    TextString: '${CalculateGrade(crHrs: crHrs,grades:grades)}',
                    FontSize: 35,
                    TextFontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    // setState(() {
                    //   result = CalculateGrade(crHrs: crHrs, grades: grades);
                    // });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: ColorCollections.TextColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 40,
                    width: 90,
                    child: Center(
                      child: ReusableText(
                        TextColor: ColorCollections.WhiteColor,
                        TextString: 'Help',
                        FontSize: 16,
                        TextFontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      subNum = 3;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorCollections.TextColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 40,
                    width: 90,
                    child: Center(
                      child: ReusableText(
                        TextColor: ColorCollections.WhiteColor,
                        TextString: 'Reset',
                        FontSize: 16,
                        TextFontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              width: 320,
              decoration: BoxDecoration(
                border: Border(
                  top: const BorderSide(color: Colors.black),
                  left: const BorderSide(color: Colors.black),
                  right: const BorderSide(color: Colors.black),
                  bottom: BorderSide.none, // Removes the bottom border
                ),
              ),
              child: ConstrainedBox(
                   constraints: BoxConstraints(minHeight: 50,minWidth: 300,),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           ReusableText(
                             TextString: 'Course',
                             FontSize: 18,
                             TextFontWeight: FontWeight.w700,
                           ),
                           ReusableText(
                             TextString: 'CrHr',
                             FontSize: 18,
                             TextFontWeight: FontWeight.w700,
                           ),ReusableText(
                             FromRight: 20,
                             TextString: 'Grade',
                             FontSize: 18,
                             TextFontWeight: FontWeight.w700,
                           ),
                         ],
                       ),

                       //list view

                       ConstrainedBox(
                         constraints: BoxConstraints(minHeight: 100,minWidth: 300,),
                         child: ListView.builder(
                             shrinkWrap: true,
                             physics: const NeverScrollableScrollPhysics(),
                           itemCount: subNum,
                             itemBuilder: (context,index){
                             return Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                   // margin: EdgeInsets.only(right: 10),
                                   height: 35,
                                   width: 90,
                                   decoration:BoxDecoration(
                                     borderRadius: BorderRadius.circular(5),
                                     border: Border.all(color: ColorCollections.GreyColor),
                                   ),
                                   child:  TextField(
                                     onChanged: (value) {
                                     },
                                     keyboardType: TextInputType.multiline,
                                     decoration: InputDecoration(
                                       // suffixIcon: suffixIcon,
                                       hintText: 'Courses',
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
                                     obscureText:  false,
                                   ),
                                 ),
                                 Container(
                                   // margin: EdgeInsets.only(right: 10),
                                   height: 30,
                                   width: 90,
                                   child: FittedBox(
                                     child: DropdownMenu(
                                   initialSelection:'4',
                                   textStyle: TextStyle(fontSize: 40),
                                       dropdownMenuEntries: [
                                         DropdownMenuEntry(
                                           value: '4',
                                           label: '4',
                                         ),
                                         DropdownMenuEntry(
                                           value: '3',
                                           label: '3',
                                         ),DropdownMenuEntry(
                                           value: '2',
                                           label: '2',
                                         ),DropdownMenuEntry(
                                           value: '1',
                                           label: '1',
                                         ),DropdownMenuEntry(
                                           value: '5',
                                           label: '5',
                                         ),
                                         DropdownMenuEntry(
                                           value: '6',
                                           label: '6',
                                         ),
                                       ],
                                       onSelected: (onSelected){
                                         setState(() {
                                           // addCrHrs(int.parse(onSelected!));
                                           crHrs[index] = int.parse(onSelected!);
                                           updateTotalCreditHours(); // Update crHrs dynamically
                                         });
                                       },
                                     ),
                                   ),
                                 ),

                                 Container(
                                   height: 30,
                                   width: 90,
                                   child: FittedBox(
                                     child: DropdownMenu(
                                       initialSelection:'A',
                                       textStyle: TextStyle(fontSize: 40),
                                       dropdownMenuEntries: [
                                         DropdownMenuEntry(
                                           value: 'A',
                                           label: 'A',
                                         ),
                                         DropdownMenuEntry(
                                           value: 'A+',
                                           label: 'A+',
                                         ),DropdownMenuEntry(
                                           value: 'A-',
                                           label: 'A-',
                                         ),DropdownMenuEntry(
                                           value: 'B',
                                           label: 'B',
                                         ),DropdownMenuEntry(
                                           value: 'B+',
                                           label: 'B+',
                                         ),
                                         DropdownMenuEntry(
                                           value: 'C',
                                           label: 'C',
                                         ),
                                         DropdownMenuEntry(
                                           value: 'C+',
                                           label: 'C+',
                                         ), DropdownMenuEntry(
                                           value: 'C-',
                                           label: 'C-',
                                         ), DropdownMenuEntry(
                                           value: 'D',
                                           label: 'D',
                                         ),
                                         DropdownMenuEntry(
                                           value: 'F',
                                           label: 'F',
                                         ),
                                       ],
                                       onSelected: (onSelected){
                                         setState(() {
                                           grades[index] = onSelected!; // Update crHrs dynamically
                                         });
                                       },
                                     ),
                                   ),
                                 ),
                               ],
                             );
                         }),
                       ),
                     ],
                   ),
                 ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   InkWell(
                     onTap:()=>addSubject(),
                     child: Container(
                       margin: EdgeInsets.only(right: 20),
                       decoration: BoxDecoration(
                         color: ColorCollections.TextColor,
                         borderRadius: BorderRadius.circular(5),
                       ),
                       height: 40,
                       width: 90,
                       child: Center(
                         child: ReusableText(
                           TextColor: ColorCollections.WhiteColor,
                           TextString: 'Add',
                           FontSize: 16,
                           TextFontWeight: FontWeight.w500,
                        ),
                       ),
                     ),
                   ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        result = CalculateGrade(crHrs: crHrs, grades: grades);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorCollections.TextColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 40,
                      width: 90,
                      child: Center(
                        child: ReusableText(
                          TextColor: ColorCollections.WhiteColor,
                          TextString: 'Calculate',
                          FontSize: 16,
                          TextFontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              height: 100,
              width: 320,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide.none,
                  left: const BorderSide(color: Colors.black),
                  right: const BorderSide(color: Colors.black),
                  bottom: const BorderSide(color: Colors.black), // Removes the bottom border
                ),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 50,minWidth: 300,),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableText(
                          FromLeft: 0,
                          FromRight: 20,
                          TextString: 'Total CrHr',
                          FontSize: 18,
                          TextFontWeight: FontWeight.w700,
                        ),
                        ReusableText(
                          FromRight: 50,
                          FromLeft: 20,
                          TextString: 'GPA',
                          FontSize: 18,
                          TextFontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: ColorCollections.GreyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 40,
                          width: 90,
                          child: Center(
                            child: ReusableText(
                              TextColor: Colors.black,
                              TextString: '${totalCreditHours}',
                              FontSize: 16,
                              TextFontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: ColorCollections.GreyColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 40,
                          width: 90,
                          child: Center(
                            child: ReusableText(
                              TextColor: Colors.black,
                              TextString: '${CalculateGrade(crHrs: crHrs,grades:grades)}',
                              FontSize: 16,
                              TextFontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  double CalculateGrade({
    required List<int> crHrs,
    required List<String> grades,
  }) {
    if (crHrs.length != grades.length) {
      print("Error: Mismatched credit hours and grades count.");
      return 0;
    }

    // Grade mapping: A = 4.0, B = 3.0, etc.
    Map<String, double> gradePoints = {
      'A+': 4.0,
      'A': 4.0,
      'A-': 3.75,
      'B+': 3.5,
      'B': 3.0,
      'B-': 2.75,
      'C+': 2.5,
      'C': 2.0,
      'C-': 1.75,
      'D': 1.0,
      'F': 0.0,
    };

    double totalGradePoints = 0.0;
    int totalCreditHours = 0;

    for (int i = 0; i < grades.length; i++) {
      String grade = grades[i];
      int creditHour = crHrs[i];

      if (!gradePoints.containsKey(grade)) {
        print("Error: Invalid grade '$grade'.");
        return 0;
      }

      totalGradePoints += gradePoints[grade]! * creditHour;
      totalCreditHours += creditHour;
    }

    if (totalCreditHours == 0) {
      print("Error: Total credit hours cannot be zero.");
      return 0;
    }

    double gpa = totalGradePoints / totalCreditHours;
    print("Your GPA is: ${gpa.toStringAsFixed(2)}");
    return double.parse(gpa.toStringAsFixed(2));;
  }

}
