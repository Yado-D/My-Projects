import 'package:exam_collector/Models/UserModels.dart';
import 'package:exam_collector/Pages/HomePage/blocs/homePageBloc.dart';
import 'package:exam_collector/Pages/HomePage/blocs/homePageEvent.dart';
import 'package:exam_collector/Pages/HomePage/blocs/homePageState.dart';
import 'package:exam_collector/auth/examFetching.dart';
import 'package:exam_collector/global.dart';
import 'package:exam_collector/utils/constants.dart';
// import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/homePageWidget.dart';

class home_page extends StatefulWidget {
  // final Map<String, dynamic>? alpha;
  const home_page({
    // this.alpha,
    super.key,
  });

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  final Future<List> fetchCarousel = fetchingExams().GetCarouselImage();
  List li = [];
  UserModels? userModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveCarouselImage();
    getAllUserData();
  }

 Future<void> getAllUserData()async{
   userModel = await Global.storageServices.getData(AppConstants.USERDATA);
   print("* user is on home page *  = user name is :  ${userModel!.userName}");
   setState(() {});
 }

  void saveCarouselImage()async{
    await fetchCarousel.then((onValue)=> li = onValue);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("this is user data : " + '${userModel!.toJson()}');
    return  Scaffold(
        drawer: Drawer(
          child: DrowerWidget(
            alpha: userModel!.toJson() ?? {},
            context: context,
          ),
        ),
        key: globalKey,
        body: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {},
          builder: (context, state) {
            // if (state is BottomTabBarState) {
            //   // print(state);
            // }
            return bottomNavBarPages(
                    // userData:userModel,
                    // alpha: widget.alpha,
                    indexOfCarousel:
                        state is CarouselSliderState ? state.changedIndex : 0,
                    context: context,
                    state: state is BottomTabBarState
                        ? state.SelectedTab
                        : InitialPageState().SelectedTab)[
                state is BottomNavBarState ? state.SelectedIndex : 0];
          },
        ),
        bottomNavigationBar: BottomNavBarWidget(
          ontap: (index) {
            setState(() {

            });
            context
                .read<HomePageBloc>()
                .add(BottomNavBarEvent(SelectedIndex: index));

          },
        ),

    );
  }

  // Widget buildbottombar({required String icons, required int index}) {
  //   return GestureDetector(
  //     onTap: () {
  //       context
  //           .read<HomePageBloc>()
  //           .add(BottomNavBarEvent(SelectedIndex: index));
  //     },
  //     child: Container(
  //       width: 50.w,
  //       height: 50.w,
  //       child: Image.asset(
  //         "assets/icons/$icons.png",
  //         color: Colors.white,
  //       ),
  //     ),
  //   );
  // }
}

// bottomNavBarPages(
//                   alpha: widget.alpha,
//                   indexOfCarousel:
//                       state is CarouselSliderState ? state.changedIndex : 0,
//                   context: context,
//                   state: state is BottomTabBarState
//                       ? state.SelectedTab
//                       : InitialPageState().SelectedTab)[
//               state is BottomNavBarState ? state.SelectedIndex : 0];



//main code


// ConstrainedBox(
//             constraints: BoxConstraints.expand(),
//             child: Stack(
//               children: [
//                 bottomNavBarPages(
//                         alpha: widget.alpha,
//                         indexOfCarousel: state is CarouselSliderState
//                             ? state.changedIndex
//                             : 0,
//                         context: context,
//                         state: state is BottomTabBarState
//                             ? state.SelectedTab
//                             : InitialPageState().SelectedTab)[
//                     state is BottomNavBarState ? state.SelectedIndex : 0],
//                 Positioned(
//                   bottom: 0.h,
//                   height: 50.h,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.black87,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20))),
//                     width: MediaQuery.of(context).size.width,
//                     height: 50.h,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         buildbottombar(icons: 'home', index: 0),
//                         buildbottombar(icons: 'search', index: 1),
//                         buildbottombar(icons: 'search', index: 2),
//                         buildbottombar(icons: 'search', index: 3),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           );