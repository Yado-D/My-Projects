import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_zoom/widget_zoom.dart';
import 'package:zoom_widget/zoom_widget.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class exam_starting_page extends StatefulWidget {
  String universityNmae;
  String courseName;
  String department;
  int examYear;
  exam_starting_page({super.key,required this.courseName,required this.department,required this.examYear,required this.universityNmae});

  @override
  State<exam_starting_page> createState() => _exam_starting_pageState();
}

class _exam_starting_pageState extends State<exam_starting_page> {
Map<String,dynamic>? snapshot;
// late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _controller = YoutubePlayerController(
    //   initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=GQyWIur03aw")!, // Replace with your YouTube video ID
    //   flags: YoutubePlayerFlags(
    //     autoPlay: false,
    //     mute: false,
    //   ),
    // );
    // fetchYears(widget.universityNmae, widget.courseName, widget.department);
  }

  // Future<void> fetchYears(String university, String course, String department) async {
  //   try {
  //     DocumentSnapshot yearSnapshot = await FirebaseFirestore.instance.collection('Exams').doc("7253ExamId").collection("University").doc(university).collection("Subject").doc(course).collection("Department").doc(department).collection("Year").doc("${widget.examYear}").get();
  //     setState(() {
  //       snapshot = yearSnapshot.data()! as Map<String, dynamic>?;
  //     });
  //   } catch (e) {
  //     print('Error fetching years: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: SimpleAppBars(context, widget.courseName),
      backgroundColor: ColorCollections.PageColor,
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('Exams').doc("7253ExamId").collection("University").doc(widget.universityNmae).collection("Subject").doc(widget.courseName).collection("Department").doc(widget.department).collection("Year").doc("${widget.examYear}").get(),
          builder: (context,snap){
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return Center(child: Text("Error: ${snap.error}"));
            }
            if (!snap.hasData || snap.data == null) {
              return Center(child: Text("No data found"));
            }
            final snaps = snap.data!;
            return Container(
              margin: EdgeInsets.all(10),
              child: Stack(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height, // Limit height for better UX
                    ),
                    child: ListView.builder(
                      shrinkWrap: true, // Ensures it fits content
                      itemCount: snaps["ExamImage"].length,
                      itemBuilder: (context, index) {
                        return  WidgetZoom(
                          heroAnimationTag: 'tag',
                          zoomWidget: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 500, // Set a fixed height for consistent display
                              decoration: BoxDecoration(
                                color: ColorCollections.WhiteColor,
                                image: DecorationImage(
                                  fit: BoxFit.cover, // Adjust to maintain aspect ratio
                                  image: NetworkImage(
                                    snaps["ExamImage"][index],
                                  ),
                                ),
                              ),
                            ),
                        );
                       
                      },
                    ),
                  ),

                  SizedBox(height: 20), // Add spacing between sections

                  // Exam Answer Section
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: GestureDetector(
                      onTap: ()=>showBottomSheet(snaps["examAnswer"]),
                      child: Container(
                        height: 60,
                        width:130,
                        decoration: BoxDecoration(
                          color: ColorCollections.TextColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: ColorCollections.WhiteColor,width: 2),
                        ),
                        child: Center(
                          child: ReusableText(
                            TextString: "Answer", FontSize: 20,
                            TextFontWeight: FontWeight.w700,
                            TextColor: ColorCollections.WhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )

    );
  }
  void showBottomSheet(List answers) {
    showModalBottomSheet(
      backgroundColor: ColorCollections.PageColor,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return ListView(
          children: [
            SizedBox(height: 20),

            // Exam Answer Section
            Container(
              margin: EdgeInsets.only(top: 10, left: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  ReusableText(
                    TextString: 'Exam Answer',
                    FontSize: 20,
                    TextFontWeight: FontWeight.w800,
                  ),
                ],
              ),
            ),

            // Displaying Images
            if (answers.isEmpty) ...[
              // If answers list is empty
              Center(
                child: ReusableText(
                  TextString: "We will add answers soon..",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w500,
                ),
              ),
            ] else ...[
              // Generate image containers only if answers are available
              ...List.generate(
                answers.length,
                    (i) {
                  if (answers[i]["image"] != null) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 500, // Fixed height for consistent display
                      decoration: BoxDecoration(
                        color: ColorCollections.WhiteColor,
                        image: DecorationImage(
                          fit: BoxFit.cover, // Maintain aspect ratio
                          image: NetworkImage(answers[i]["image"]),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      height: 50,
                      color: Colors.grey,
                      child: Center(
                        child: ReusableText(
                          TextString: "Image not available",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],

            // Final Message
            Column(
              children: [
                Center(
                  child: ReusableText(
                    TextString: "Good Luck!",
                    FontSize: 20,
                    TextFontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

























// class exam_starting_page extends StatelessWidget {
//   exam_starting_page({
//     super.key,
//   });
//   int time = 2;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ColorCollections.PrimaryColor,
//         appBar: AppBar(
//           backgroundColor: ColorCollections.PrimaryColor,
//           leading: Container(
//             margin: EdgeInsets.all(15),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 size: 35,
//               ),
//             ),
//           ),
//         ),
//         body: Container(
//           margin: const EdgeInsets.only(top: 120, left: 40),
//           child: Stack(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ReusableText(
//                     TextString: 'This Exam Takes : $time hours',
//                     FontSize: 16,
//                     TextFontWeight: FontWeight.w500,
//                     TextColor: ColorCollections.SecondaryColor,
//                   ),
//                   ReusableText(
//                     FromTop: 20,
//                     TextString: 'Please Choose What Method ',
//                     FontSize: 16,
//                     TextFontWeight: FontWeight.w500,
//                     TextColor: ColorCollections.SecondaryColor,
//                   ),
//                   ReusableText(
//                     FromTop: 0,
//                     TextString: 'You Want To Chose',
//                     FontSize: 16,
//                     TextFontWeight: FontWeight.w500,
//                     TextColor: ColorCollections.SecondaryColor,
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 40, left: 20),
//                       child: AppButton(
//                         ButtonHeight: 50,
//                         ButtonWidth: 180,
//                         ContainerColor: ColorCollections.WhiteColor,
//                         ButtonColor: ColorCollections.SecondaryColor,
//                         ButtonText: 'Instant Answer',
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 40, left: 20),
//                       child: AppButton(
//                         ButtonHeight: 50,
//                         ButtonWidth: 180,
//                         ContainerColor: ColorCollections.WhiteColor,
//                         ButtonColor: ColorCollections.SecondaryColor,
//                         ButtonText: 'After the end',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Positioned(
//                 bottom: 40,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pushNamed('/exam_started_page');
//                   },
//                   child: Container(
//                     height: 40,
//                     width: 150,
//                     margin:
//                         const EdgeInsets.only(left: 80, bottom: 20, top: 70),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       image: const DecorationImage(
//                         fit: BoxFit.fill,
//                         image: AssetImage('assets/Images/ButtonColor.jpg'),
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Next',
//                         style: TextStyle(
//                           fontSize: 28,
//                           color: ColorCollections.WhiteColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
}