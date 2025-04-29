import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/services.dart';
import 'package:shega_cloth_store_app/database/provider.dart';
import 'package:shega_cloth_store_app/screens/bottomBarScreens/product.dart';
import 'package:shega_cloth_store_app/screens/bottomBarScreens/search.dart';
import 'package:shega_cloth_store_app/screens/otherScreens/filter.dart';
import 'package:shega_cloth_store_app/screens/otherScreens/orderPage.dart';
import 'package:shega_cloth_store_app/screens/splash%20and%20onboarding/splash_screen.dart';

import '/firebase_options.dart';
import '/prefs/loginPreference.dart';
import '/screens/first-page.dart';
import '/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider<UserProvider>(
    child: const MyApp(),
    create: (_) => UserProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => defaultt(),
        )
      ],
      child: Consumer<defaultt>(
        builder: (context, value, child) {
          return MaterialApp(
            routes: {
              '/search': (context) => SearchScreen(),
              '/filter': (context) => filter(),
              '/order': (context) => OrdersPage(),
              '/cart': (context) => productScreen(),
              '/notification': (context) => productScreen(),
            },
            debugShowCheckedModeBanner: false,
            home: Splash(isUserLoggedIn: value.islogin && value.isUser),
          );
        },
      ),
    );
  }
}
