import 'package:exam_collector/Pages/Welcome%20Pages/WelcomePageOnlyTeacher/teacher_info_bloc.dart';
import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/utils/AppShowDialogueWidget.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectTeacherInfo extends StatefulWidget {
  const CollectTeacherInfo({super.key});

  @override
  State<CollectTeacherInfo> createState() => _CollectTeacherInfoState();
}

class _CollectTeacherInfoState extends State<CollectTeacherInfo> {
  List<String> teacherAch = [];
  String achivment = '';
  String biography = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: Stack(
        children: [
          // const FullPageContainer(),
          ListView(
            children: [
               ReusableText(
                  FromLeft: 30,
                  FromTop: 10,
                  TextString: 'Please Input your Biography/speciality',
                  FontSize: 20,
                  TextFontWeight: FontWeight.bold,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(right: 15,left: 15),
                margin: EdgeInsets.only(right: 15,left: 15),
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorCollections.GreyColor,
                ),
                child: ReusableText(
                  TextString: 'e.g. I am a mathematics professional with a strong background in research and education. Having earned my PhD in Mathematics, I am deeply passionate about exploring complex problems, fostering innovative solutions, and contributing to academic advancement.',
                  FontSize: 15,
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: reusableTextField(
                    widthOfTextField: 200,
                    heightOfContainer: 100,
                    heightOfTextField: 100,
                    hintText: 'input your biography',
                    textType: 'biography',
                    onchange: (onchange){
                         setState(() {
                           biography = onchange;
                         });
                   },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    FromLeft: 30,
                    FromTop: 10,
                    TextString: 'Please Input your Achievment',
                    FontSize: 20,
                    TextFontWeight: FontWeight.bold,
                    TextColor: ColorCollections.SecondaryColor,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      onPressed: (){
                        customShowDialogue();
                      },
                      icon: Icon(Icons.add,color: Colors.white,),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorCollections.GreyColor,
                ),
                child: ListView.builder(
                  itemCount: teacherAch.length,
                    itemBuilder: (context,index){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black87,
                      ),
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(
                            TextString: teacherAch[index],
                            FontSize: 16,
                            TextColor: ColorCollections.WhiteColor,
                            TextFontWeight: FontWeight.w500,
                          ),
                          IconButton(
                            onPressed: (){
                              teacherAch.removeAt(index);
                              setState(() {
                              });
                            },
                            icon: Icon(Icons.delete,color: Colors.red,),
                          ),
                        ],
                      ),
                    );
                }),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {

                    //work on some provider stuffs
                     context.read<TeacherInfoBloc>().add(teacherInfo(biography: biography,achivment: teacherAch));
                     final state = context.read<TeacherInfoBloc>().state;
                     List<String>? emailAddress = state.achivment;
                     print(emailAddress);
                      Navigator.of(context).pushNamed('/welcome_page3');
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    margin: EdgeInsets.only(top: 50),
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
          )
        ],
      ),
    );
  }
  void customShowDialogue(){
     showAdaptiveDialog(
         context: context,
         builder: (builder){
         return SimpleDialog(
           children: [
             ReusableText(
               FromLeft: 30,
               FromTop: 10,
               TextString: 'Please type your acheivment shortly',
               FontSize: 16,
               TextColor: ColorCollections.SecondaryColor,
             ),
             Container(
               margin: EdgeInsets.all(15),
               child: reusableTextField(
                 widthOfTextField: 100,
                 heightOfContainer: 50,
                 heightOfTextField: 50,
                 hintText: 'input your achivment',
                 textType: 'biography',
                 onchange: (onchange){
                     setState(() {
                       achivment = onchange;
                     });
                 },
               ),
             ),
             InkWell(
               onTap: (){
                 if(achivment!=''){
                   teacherAch.add(achivment);
                   Navigator.pop(context);
                 }
                 else{
                   Navigator.pop(context);
                   customShowSnackbar(context);
                 }
               },
               child: Center(
                 child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: ColorCollections.PrimaryColor,
                   ),
                   height: 50,
                   width: 100,
                   child: Center(
                     child: ReusableText(
                       TextString: 'Add',
                       FontSize: 18,
                     ),
                   ),
                 ),
               ),
             ),
           ],
         );
     });
  }
  void customShowSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: ReusableText(
          TextString: "Please Input the required field.",
          TextColor: ColorCollections.WhiteColor,
          FontSize: 18,
          ),
        ),
    );
  }
}
