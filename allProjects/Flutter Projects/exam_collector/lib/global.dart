import 'package:exam_collector/Models/UserModels.dart';
import 'package:exam_collector/firebase_options.dart';
import 'package:exam_collector/services/storage_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Global {
  static late StorageServices storageServices;
  static late UserModels userModels;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    storageServices = await StorageServices().init();
  }
}
