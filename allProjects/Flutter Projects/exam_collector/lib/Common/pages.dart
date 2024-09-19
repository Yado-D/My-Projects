import 'package:exam_collector/Common/name.dart';
import 'package:exam_collector/Pages/ExamStartedPage/pages/exam_started_page.dart';
import 'package:exam_collector/Pages/ExamStarting/pages/examStarting_page.dart';
import 'package:exam_collector/Pages/HomePage/Drawers_pages/about_page.dart';
import 'package:exam_collector/Pages/HomePage/Drawers_pages/faq.dart';
import 'package:exam_collector/Pages/HomePage/Drawers_pages/help_page_all_part.dart';
import 'package:exam_collector/Pages/HomePage/blocs/homePageBloc.dart';
import 'package:exam_collector/Pages/HomePage/pages/HomePage.dart';
import 'package:exam_collector/Pages/Settings%20page/pages/settingsPage.dart';
import 'package:exam_collector/Pages/SignInPage/Page/Sign_in_page.dart';
import 'package:exam_collector/Pages/SignUpPage/Pages/Sign_up_page.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage1/UI/welcomePage1.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage2/Bloc/welcomePage2Bloc.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage2/UI/WelcomePage2.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage3/UI/WelcomePage3.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage4/UI/WelcomePage4.dart';
import 'package:exam_collector/Pages/premium/pages/payingMethods.dart';
import 'package:exam_collector/Pages/premium/pages/premiumPages.dart';
import 'package:exam_collector/Pages/premium/pages/sendScreenshot.dart';
import 'package:exam_collector/Pages/premium/pages/verifyPage.dart';
import 'package:exam_collector/Pages/resultPage/page/resultPage.dart';
import 'package:exam_collector/Pages/searchPage/page/search_page.dart';
import 'package:exam_collector/global.dart';
import 'package:exam_collector/widgets/simple_pages/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Pages/SignInPage/Bloc/SignInBloc.dart';
import '../Pages/SignUpPage/Bloc/SignUpBloc.dart';
import '../Pages/Welcome Pages/welcomePage3/Bloc/WelcomePage3Bloc.dart';
import '../Pages/Welcome Pages/welcomePage4/Bloc/WelcomePage4Bloc.dart';

class NamedRouteSettings {
  NamedRouteSettings({required BuildContext context});

  static List<pageEntity> allPages() {
    return [
      pageEntity(
        route: NamedRoutes.WELCOCME_PAGE1,
        page: WelcomePage1(),
      ),
      pageEntity(
        route: NamedRoutes.WELCOCME_PAGE2,
        page: WelcomePage2(),
        bloc: BlocProvider(
          create: (_) => WelcomePage2Bloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.WELCOCME_PAGE3,
        page: WelcomePage3(),
        bloc: BlocProvider(
          create: (_) => Welcomepage3bloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.WELCOCME_PAGE4,
        page: Welcomepage4(),
        bloc: BlocProvider(
          create: (_) => Welcomepage4blocs(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.SIGNIN_PAGE,
        page: SignInPage(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.SIGNUP_PAGE,
        page: SignUpPage(),
        bloc: BlocProvider(
          create: (_) => SignUpBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.HOME_PAGE,
        page: home_page(),
      ),
      pageEntity(
        route: NamedRoutes.PREMIUM_PAGE,
        page: Premiumpages(),
      ),
      pageEntity(
        route: NamedRoutes.HOME_PAGE,
        page: home_page(),
        bloc: BlocProvider(
          create: (_) => HomePageBloc(),
        ),
      ),
      pageEntity(
        route: NamedRoutes.EXAM_STARTING_PAGE,
        page: exam_starting_page(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.EXAM_STARTED_PAGE,
        page: exam_started_page(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.RESULT_PAGE,
        page: result_page(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.SEARCH_PAGE,
        page: search_page(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.SETTINGS_PAGE,
        page: SettingsPage(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.ACCOUNT_PAGE,
        page: account_page(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.PAYMENT_PAGE,
        page: PaymentMethods(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.CHECKSCREENSHOOT_PAGE,
        page: SendScreenShot(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.VERIFY_PAGE,
        page: VerifyPage(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.FAQ_PAGE,
        page: FAQ_pages(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.HELP_PAGE,
        page: HelpSection(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.ABOUT_PAGE,
        page: AboutPage(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.TROUBLESHOOTING_PAGE,
        page: TroubleshootingSection(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.CONTACT_PAGE,
        page: ContactSupportSection(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
      pageEntity(
        route: NamedRoutes.USERMANUAL_PAGE,
        page: UserManualSection(),
        // bloc: BlocProvider(
        //   create: (_) => HomePageBloc(),
        // ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in allPages()) {
      if (bloc.bloc != null) blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var route = allPages().where((element) => element.route == settings.name);
      if (route.isNotEmpty) {
        //check if the user is already logged in to dont exaust user
        // by asking loggin again and again
        bool firstStartApp = Global.storageServices.GetDeviceFirstOpen();
        if (route.first.route == NamedRoutes.WELCOCME_PAGE1 && firstStartApp) {
          print('the user already pass the welcome page 4');
          return MaterialPageRoute(
              builder: (_) => SignInPage(), settings: settings);
        }
        if (route.first.route == NamedRoutes.HOME_PAGE &&
            settings.arguments != null) {
          final arg = settings.arguments;
          if (arg is Map<String, dynamic>?) {
            print('user is  on free type');
            return MaterialPageRoute(
                builder: (_) => home_page(alpha: arg), settings: settings);
          }
        }
        if (route.first.route == NamedRoutes.ACCOUNT_PAGE &&
            settings.arguments != null) {
          final arg = settings.arguments;
          if (arg is Map<String, dynamic>?) {
            print('user is  on free type');
            return MaterialPageRoute(
                builder: (_) => account_page(alpha: arg), settings: settings);
          }
        } else {
          return MaterialPageRoute(
              builder: (_) => route.first.page, settings: settings);
        }
      }
      print('invalid routes');
    }
    return MaterialPageRoute(
        builder: (_) => const WelcomePage1(), settings: settings);
  }
}

class pageEntity {
  String route;
  Widget page;
  dynamic bloc;
  pageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
