import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/database/models/admin.dart';
import 'package:shega_cloth_store_app/database/models/user.dart';

class UserProvider extends ChangeNotifier {
  Map<String, dynamic> userModel = {};

  void userSignIn(Users user) {
    userModel = user.tojson();
    notifyListeners();
  }

  void userSignInMap(Map<String, dynamic> user) {
    userModel = user;
    notifyListeners();
  }

  void userSignOut() {
    userModel.clear();
    notifyListeners();
  }

  Map<String, dynamic> adminModel = {};

  void adminSignIn(Admins admin) {
    adminModel = admin.tojson();
    notifyListeners();
  }

  void adminSignInMap(Map<String, dynamic> admin) {
    adminModel = admin;
    notifyListeners();
  }

  void adminSignOut() {
    adminModel.clear();
    notifyListeners();
  }

  // Method to update admin name
  void updateAdminName(String newName) {
    adminModel['username'] = newName;
    notifyListeners();
  }

  // Method to update default profile image for admin
  void updateAdminDefaultProfileImage(String newImageUrl) {
    adminModel['profileImageUrl'] = newImageUrl;
    notifyListeners();
  }

  // Method to update admin name
  void updateUserName(String newName) {
    userModel['username'] = newName;
    notifyListeners();
  }

  // Method to update default profile image for admin
  void updateUserDefaultProfileImage(String newImageUrl) {
    userModel['profileImageUrl'] = newImageUrl;
    notifyListeners();
  }
}
