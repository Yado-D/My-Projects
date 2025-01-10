import 'dart:convert';

import 'package:exam_collector/Models/UserModels.dart';
import 'package:exam_collector/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _prefs;
  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool GetDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPENED_FIRST) ?? false;
  }

  Future<void> setData(String key, UserModels value) async {
    await _prefs.setString(key, jsonEncode(value.toJson()));
  }

  UserModels? getData(String key) {
    String? jsonString = _prefs.getString(key);
    if (jsonString != null) {
      return UserModels.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}
