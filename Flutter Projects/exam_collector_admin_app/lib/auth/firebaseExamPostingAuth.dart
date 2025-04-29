
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_collector_admin_app/auth/uploadingImage.dart';
import 'package:exam_collector_admin_app/models/answer_model.dart';
import 'package:uuid/uuid.dart';

class AuthMethod{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> PostQuestionsToFireaseDatabase (
      {required String subjectName,
        required String universityName,
        required int year,
        required List<Uint8List?> ExamImage,
        required String department,
        required List<answerModel> aModel,
      })async{
    String res = "Some error occured";
    try{
      List<String> ExamImages = [];
      for(int i=0;i<ExamImage.length;i++){
        String url = await uploadingimage('product', ExamImage[i]!);
        ExamImages.add(url);
      }

      print({
        "subjectName": subjectName,
        // "ExamImage": ExamImage.map((image) => image?.toList()).toList(),
        "year": year,
        "universityName": universityName,
        "department": department,
        "examAnswer": aModel.map((answer) => answer.toMap()).toList(),
      });
      String uniqueID = const Uuid().v1();
      await  _firestore.collection("Exams")
          .doc("7253ExamId").collection("University")
          .doc("${universityName}").collection("Subject")
          .doc("${subjectName}").collection("Department")
          .doc("${department}").collection("Year")
          .doc("$year").set({
            "subjectName":subjectName,
            "ExamImage":ExamImages,
            "year":year,
            "universityName":universityName,
            "department": department,
            "examAnswer":aModel.map((answer) => answer.toMap()).toList(),
      });
      res  = "SuccessFully Posted";
      return res;
    }catch(e){
      res  = "Error posting : ${e.toString()}";
      return res;
    }
  }

  //post carousel images

  Future<String>  carouselImagePost({required List<String> carouselImage})async{
    try{
     // String uuid = Uuid().v1();
       final result = await _firestore.collection('CarouselImage').doc("Image").set({
         'carouselImage': carouselImage,
       });
       return 'successfull';
    }catch(e){
      return e.toString();
    }
  }
}
