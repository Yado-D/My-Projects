import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

class simple_vehicle_firebase_api{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot>> getAllVehicleData()async{
     try{
       QuerySnapshot data =  await _firestore.collection("simpleVehicles").get();
       final d =  data.docs;
       return d;
     }catch(e){
       print("error on featching");
        return [];
     }
  }

  Future<String> updateSimpleVehicleInfo(String documentId,String newVal,String type)async{
    String res = 'unexpected error';
    try{
     await _firestore.collection('simpleVehicles').doc(documentId).update({
        '$type':newVal,
      });
      return "Successfully updated!";
    }catch(e){
        return "Some Error Ocurred : ${e.toString()}";
    }
  }
  Future<String> addMoreVehicles(name,fuelLevel,location)async{
    String res = 'unknown error';
    try{
      String uuid = Uuid().v1();
      final random = Random();
      int randomIndex = random.nextInt(imgList.length);
      await _firestore.collection('simpleVehicles').doc(uuid).set({
        "name":"$name",
        "fuelLevel":"$fuelLevel",
        "lastLocation":"$location",
        "image":"${imgList[randomIndex]}"
      });
      res = 'successfull';
       return res;
    }catch(e){
        print("error");
        res = 'error';
        return res;
    }
  }
List<String> imgList = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEF7EUkgNAJDYYeBcQAdR1KyPZeAmM_9ENqA&s",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq9KHEkGcrTD2D3iJenBK1tR-dG2BN4iZNbA&s",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS7_oOjKACmsZOmuwDxEFcvXr5gjiP6QZLkQ&s",
  "https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/model_gw/urus/2022/08_19_urus_perf/gate_urus_og.jpg",
];

}