import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unihub/features/pages/onboardingPage/onboardingPage1/onboarding_page1.dart';
import 'package:unihub/services/theme_mode_provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext)=>ThemeManager())
      ],
      builder: (BuildContext context,child){
        return MaterialApp(
          themeMode: Provider.of<ThemeManager>(context).themeMode,
          home: OnboardingScreen1(),
        );
      }
    );
  }
}
