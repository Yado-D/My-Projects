// import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_collector/Pages/ExamStartedPage/pages/exam_started_page.dart';
import 'package:exam_collector/Pages/ExamStarting/pages/examStarting_page.dart';
import 'package:exam_collector/auth/examFetching.dart';
import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/utils/AppShowDialogueWidget.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:exam_collector/widgets/CommonSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class exam_page extends StatefulWidget {
  const exam_page({super.key});

  @override
  _exam_pageState createState() => _exam_pageState();
}

class _exam_pageState extends State<exam_page> {
  String? selectedUniversity;
  String? selectedCourse;
  String? selectedDepartment;
  String? selectedYear;

  List<String> universities = [];
  List<String> courses = [];
  List<String> departments = [];
  List<int> years = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    fetchUniversitys();
  }

  Future<void> fetchUniversitys() async {
    try {
      QuerySnapshot courseSnapshot = await _firestore.collection('Exams').doc("7253ExamId").collection("University").get();
      setState(() {
        universities = courseSnapshot.docs.map((doc) => doc.id).toList();

      });
    } catch (e) {
      print('Error fetching universitys: $e');
    }
  }


  Future<void> fetchCourses(String university) async {
    try {
      QuerySnapshot courseSnapshot = await _firestore.collection('Exams').doc("7253ExamId").collection("University").doc(university).collection("Subject").get();
      setState(() {
        courses = courseSnapshot.docs.map((doc) => doc.id).toList();

      });
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

  Future<void> fetchDepartments(String university, String course) async {
    try {
      QuerySnapshot departmentSnapshot = await _firestore.collection('Exams').doc("7253ExamId").collection("University").doc(university).collection("Subject").doc(course).collection("Department").get();
      setState(() {
        departments = departmentSnapshot.docs.map((doc) => doc.id).toList();
      });
    } catch (e) {
      print('Error fetching departments: $e');
    }
  }

  Future<void> fetchYears(String university, String course, String department) async {
    try {
      QuerySnapshot yearSnapshot = await _firestore.collection('Exams').doc("7253ExamId").collection("University").doc(university).collection("Subject").doc(course).collection("Department").doc(department).collection("Year").get();
      setState(() {
        years = yearSnapshot.docs.map((doc) => int.parse(doc.id)).toList();
      });
    } catch (e) {
      print('Error fetching years: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCollections.TextColor,
        title: Center(
          child: ReusableText(
            FromLeft: 0,
            TextString: 'Select Exams',
            FontSize: 25,
            TextColor: ColorCollections.WhiteColor,
          ),
        ),
      ),
      backgroundColor: ColorCollections.PageColor,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 30,
                  FromBottom: 0,
                  TextString: 'Select Exam Information',
                  FontSize: 30,
                  TextFontWeight: FontWeight.w900,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                SizedBox(height: 20),
                ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: 'University',
                  FontSize: 20,
                  TextFontWeight: FontWeight.w700,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                if (universities.isNotEmpty)
                  DropdownButton<String>(
                    value: selectedUniversity,
                    hint: Text('Select University'),
                    items: universities.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedUniversity = newValue!;
                        selectedCourse = null;
                        selectedDepartment = null;
                        selectedYear = null;
                        courses = [];
                        departments = [];
                        years = [];
                        fetchCourses(selectedUniversity!);
                      });
                    },
                  )
                else
                  CircularProgressIndicator(),
                ReusableText(
                  FromBottom: 0,
                  TextString: 'Course Name',
                  FontSize: 20,
                  TextFontWeight: FontWeight.w400,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                if (courses.isNotEmpty)
                  DropdownButton<String>(
                    value: selectedCourse,
                    hint: Text('Choose your course'),
                    items: courses.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCourse = newValue!;
                        selectedDepartment = null;
                        selectedYear = null;
                        departments = [];
                        years = [];
                        fetchDepartments(selectedUniversity!, selectedCourse!);
                      });
                    },
                  )
                else if (selectedUniversity != null)
                  CircularProgressIndicator(),
                ReusableText(
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Department',
                  FontSize: 20,
                  TextFontWeight: FontWeight.w400,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                if (departments.isNotEmpty)
                  DropdownButton<String>(
                    value: selectedDepartment,
                    hint: Text('Select Department'),
                    items: departments.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDepartment = newValue!;
                        selectedYear = null;
                        years = [];
                        fetchYears(selectedUniversity!, selectedCourse!, selectedDepartment!);
                      });
                    },
                  )
                else if (selectedCourse != null)
                  CircularProgressIndicator(),
                ReusableText(
                  FromTop: 10,
                  FromBottom: 0,
                  TextString: 'Exam Year',
                  FontSize: 20,
                  TextFontWeight: FontWeight.w400,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                if (years.isNotEmpty)
                  DropdownButton<int>(
                    value: selectedYear == null ? null : int.parse(selectedYear!),
                    hint: Text('Select Year'),
                    items: years.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        selectedYear = newValue.toString();
                      });
                    },
                  )
                else if (selectedDepartment != null)
                  CircularProgressIndicator(),
                GestureDetector(
                  onTap: () {
                    if(selectedUniversity!=null && selectedCourse!=null &&selectedDepartment!=null &&selectedYear!=null ){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>exam_starting_page(courseName: selectedCourse!, department: selectedDepartment!, examYear: int.parse(selectedYear!), universityNmae: selectedUniversity!),),);

                    }else{
                      commonSnackBar(context, 'Please choose the selected value');
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    margin: const EdgeInsets.only(left: 80, bottom: 20, top: 150),
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
