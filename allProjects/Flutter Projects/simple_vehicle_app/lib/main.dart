import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_vehicle_app/APIs/simple_vehicle_api_to_firebase.dart';
import 'package:simple_vehicle_app/APIs/uploadingImage.dart';
import 'package:simple_vehicle_app/Common/commonWidgets.dart';
import 'package:simple_vehicle_app/DashbordPage/main_daashbord_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple_vehicle_app/utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? pickedImage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade500,
        title: Center(
            child: ReusableText(
              TextString: "Vehicls Dashbord",
              FontSize: 20,
            ),
        ),
      ),
      body: MainDashboardPage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: ()async{
          customAddingShowDialog(context);
          // await simple_vehicle_firebase_api().addMoreVehicles(name, fuelLevel, location);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
