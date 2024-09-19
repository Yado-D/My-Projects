import 'package:exam_collector/Common/pages.dart';
import 'package:exam_collector/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...NamedRouteSettings.allBlocProviders(context)],
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: NamedRouteSettings.GenerateRouteSettings,
        ),
      ),
    );
  }
}
