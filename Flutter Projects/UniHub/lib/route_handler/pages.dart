import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihub/features/pages/onboardingPage/onboardingPage1/onboarding_page1.dart';
import 'package:unihub/features/pages/onboardingPage/onboardingPage1/onboarding_page1.dart';
import 'package:unihub/route_handler/name.dart';
import 'package:unihub/services/global.dart';

class NamedRouteSettings {
  NamedRouteSettings({required BuildContext context});

  static List<pageEntity> allPages() {
    return [
      pageEntity(
        route: NamedRoutes.ONBOARDINGSCREEN1,
        page: const OnboardingScreen1(),
      ),
      // pageEntity(
      //   route: NamedRoutes.ONBOARDINGPERSONALINFORMATION,
      //   page: OnboardingPersonalInformation(),
      //   bloc: BlocProvider(
      //     create: (_) => WelcomeProfileSetupBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.STUDYSCHEDULEPAGE,
      //   page: OnboardingStudySchedule(),
      //   bloc: BlocProvider(
      //     create: (_) => WelcomePage2Bloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.STUDYPAGE,
      //   page: PomodoroTimerPage(),
      //   bloc: BlocProvider(
      //     create: (_) => WelcomePage2Bloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.HOMEPAGE,
      //   page: Home_Page(),
      //   bloc: BlocProvider(
      //     create: (_) => HomeBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.INDEXPAGE,
      //   page: Index_Page(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => WelcomePage2Bloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.QUIZPAGE,
      //   page: Quiz_Page(),
      //   bloc: BlocProvider(
      //     create: (_) => QuizBloc()..add(LoadQuestions()),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.LEARNINGSTYLE,
      //   page: OnboardingLearningStyle(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => QuizBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.WELCOMEPROFILESETUPPAGE_4,
      //   page: Welcome_Page_4(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => QuizBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.WELCOMEPROFILESETUPPAGE_5,
      //   page: OnboardingFinalDatePicker(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => QuizBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.ONBOARDINGACADEMICINFORMATRION,
      //   page: OnboardingAcademicInformation(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => QuizBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.ONBOARDINGCOURSEDIFFICULTY,
      //   page: OnboardingCourseDifficultyAndPrefrence(),
      //   bloc: BlocProvider(
      //     create: (_) => AcademicInfoBloc(),
      //   ),
      // ),
      // // pageEntity(
      // //   route: NamedRoutes.ONBOARDINGFINALDATEPICKER,
      // //   page: OnboardingFinalDatePicker(),
      // //   // bloc: BlocProvider(
      // //   //   create: (_) => AcademicInfoBloc(),
      // //   // ),
      // // ),
      // pageEntity(
      //   route: NamedRoutes.ONBOARDINGGOALSETUP,
      //   page: OnboardingGoalSetup(),
      //   bloc: BlocProvider(
      //     create: (_) => GoalSetupBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.ONBOARDINGMOTIVATIONFACTOR,
      //   page: OnBoardingMotivationFactor(),
      //   bloc: BlocProvider(
      //     create: (_) => MotivationFactorBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.STUDYWITHFRIEND,
      //   page: StudyWithFriend(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => GoalSetupBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.ROLEMODELPAGE,
      //   page: RollModel(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => GoalSetupBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.HOBBIESPAGE,
      //   page: OnboardingHobbiesPage(),
      //   bloc: BlocProvider(
      //     create: (_) => NewHobbiesBloc()..add(LoadHobbies()),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.LANGUAGEPAGE,
      //   page: LanguagePage(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => GoalSetupBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.PERSONALINFOPAGE,
      //   page: PersonalInfo(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => GoalSetupBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.STUDYHABITPAGE,
      //   page: StudyHabbitPage(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => GoalSetupBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.ACADEMICPREFRENCE,
      //   page: AcademicPrefrence(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => GoalSetupBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.GOALSPAGE,
      //   page: GoalsPage(),
      //   bloc: BlocProvider(
      //     create: (_) => GoalSetupBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.SOCIALCONNECTION,
      //   page: SocialConnection(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => GoalSetupBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.FUNANDACTIVITY,
      //   page: FindAndActivity(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => GoalSetupBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.AIPAGE,
      //   page: AIPage(),
      //   bloc: BlocProvider(
      //     create: (context) => AipageBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.STUDYPLANSETUPPAGE,
      //   page: StudyPlanSetup(),
      //   // bloc: BlocProvider(
      //   //   create: (_) => GoalSetupBloc(),
      //   // ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.SPECIFICSTUDYPLANSETUPPAGE,
      //   page: SpecificStudyPlan(),
      //   bloc: BlocProvider(
      //     create: (_) => SpecificStudyPlanBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.SETTINGACADEMICPREFERENCE,
      //   page: SettingAcademicPreference(),
      //   bloc: BlocProvider(
      //     create: (_) => GoalSetupBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.SETTINGMOTIVATION,
      //   page: SettingMotivation(),
      //   bloc: BlocProvider(
      //     create: (_) => GoalSetupBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.SETTINGSOCIALCONNECTION,
      //   page: SettingSocialConnection(),
      //   bloc: BlocProvider(
      //     create: (_) => GoalSetupBloc(),
      //   ),
      // ),
      // pageEntity(
      //   route: NamedRoutes.SETTINGHOBBIES,
      //   page: SettingHobbies(),
      //   bloc: BlocProvider(
      //     create: (_) => GoalSetupBloc(),
      //   ),
      // ),
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
        //check whether or not user is login or not
        bool alreadyMember = Global.storageServices.GetDeviceFirstOpen();
        // final userData =  Global.storageServices.getUserData(AppConstants.USER_DATA);
        if (route.first.route == NamedRoutes.ONBOARDINGSCREEN1 && alreadyMember) {
          print('the user already pass the welcome page 4');
          return MaterialPageRoute(builder: (_) => OnboardingScreen1());
        }

        print('valid routes');
        return MaterialPageRoute(
            builder: (_) => route.first.page, settings: settings);
        //check if the user is already logged in to dont exaust user
        // by asking loggin again and again
        //   bool firstStartApp = Global.storageServices.GetDeviceFirstOpen();
        //   if (route.first.route == NamedRoutes.WELCOCME_PAGE1 && firstStartApp) {
        //     print('the user already pass the welcome page 4');
        //     return MaterialPageRoute(
        //         builder: (_) => const SignInPage(), settings: settings);
        //   }
        //   if (route.first.route == NamedRoutes.HOME_PAGE &&
        //       settings.arguments != null) {
        //     final arg = settings.arguments;
        //     if (arg is Map<String, dynamic>?) {
        //       print('user is  on free type');
        //       return MaterialPageRoute(
        //           builder: (_) => home_page(alpha: arg), settings: settings);
        //     }
        //   }
        //   if (route.first.route == NamedRoutes.ACCOUNT_PAGE &&
        //       settings.arguments != null) {
        //     final arg = settings.arguments;
        //     if (arg is Map<String, dynamic>?) {
        //       print('user is  on free type');
        //       return MaterialPageRoute(
        //           builder: (_) => account_page(alpha: arg), settings: settings);
        //     }
        //   } else {
        //     return MaterialPageRoute(
        //         builder: (_) => route.first.page, settings: settings);
        //   }
      }
      print('invalid routes');
    }
    return MaterialPageRoute(
        builder: (_) => const OnboardingScreen1(), settings: settings);
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
