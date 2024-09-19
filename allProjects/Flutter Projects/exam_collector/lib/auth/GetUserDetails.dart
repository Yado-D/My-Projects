import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_collector/Models/UserModels.dart';

class Getuserdetails {
  final String email;
  Getuserdetails({required this.email});

  Stream<List<Map<String, dynamic>>> getContactDetails() {
    return FirebaseFirestore.instance
        .collection('Users')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((snap) {
        final user = snap.data();
        return user;
      }).toList();
    });
  }

//store user details in modals

  Future<Map<String, dynamic>> userMap() async {
    Stream<List<Map<String, dynamic>>> data = getContactDetails();

    List<Map<String, dynamic>> Data = await data.first;
    List<Map<String, dynamic>> allData = Data.where((element) {
      return element['userEmail'] == email;
    }).toList();

    if (allData.isNotEmpty) {
      UserModels detail = UserModels(
        userName: allData[0]['userName'],
        userEmail: allData[0]['userEmail'],
        userPassword: allData[0]['userPassword'],
        userPhone: allData[0]['userPhone'],
        userCurrentStatus: allData[0]['userCurrentStatus'],
        userEducationLevel: allData[0]['userEducationLevel'],
        userUniversity: allData[0]['userUniversity'],
        userType: allData[0]['userType'],
      );
      return detail.toMap();
    } else {
      return {};
    }
  }
}
