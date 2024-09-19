//this is for carousel slider image

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:exam_collector/Pages/HomePage/blocs/homePageBloc.dart';
import 'package:exam_collector/Pages/HomePage/blocs/homePageEvent.dart';
import 'package:exam_collector/Pages/HomePage/blocs/homePageState.dart';
import 'package:exam_collector/auth/authetication.dart';
import 'package:exam_collector/global.dart';
import 'package:exam_collector/utils/AppColorCollections.dart';
import 'package:exam_collector/utils/AppShowDialogueWidget.dart';
import 'package:exam_collector/utils/constants.dart';
import 'package:exam_collector/utils/premium%20images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/AllCommonWidget.dart';

GlobalKey<ScaffoldState> globalKey = GlobalKey();
Widget DrawerWidgets({
  required String iconText,
  required String ImageType,
  required String Text,
  required Color? color,
}) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Row(
      children: [
        Container(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/icons/${iconText}.$ImageType',
            color: color,
          ),
        ),
        ReusableText(
          FromLeft: 20,
          TextString: Text,
          FontSize: 25,
          TextFontWeight: FontWeight.bold,
          TextColor: ColorCollections.WhiteColor,
        ),
      ],
    ),
  );
}

Widget carouselSliderImage({required String carouselImage}) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    height: 220,
    width: 366,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/Images/$carouselImage.jpg',
        ),
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

Widget sliverButtonTabImage({required String SliverImage}) {
  return Container(
    margin: EdgeInsets.only(right: 10, top: 25),
    height: 250,
    width: 150,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/icons/$SliverImage.png',
        ),
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

Widget titleBar(BuildContext context, {required Map<String, dynamic>? alpha}) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                globalKey.currentState!.openDrawer();
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: ColorCollections.SecondaryColor,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/icons/01.png'),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 0),
                      color: ColorCollections.SecondaryColor,
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
            ReusableText(
              TextString: alpha!['userName'] ?? '',
              FontSize: 18,
              TextFontWeight: FontWeight.bold,
              TextColor: ColorCollections.SecondaryColor,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            //here go to the search screen
            Navigator.of(context).pushNamed('/search_page');
          },
          child: Container(
            height: 50,
            width: 250,
            margin: EdgeInsets.only(right: 15, top: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 0),
                  color: ColorCollections.TeritiaryColor,
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
              color: ColorCollections.WhiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/search.png',
                    height: 30,
                  ),
                  Center(
                    child: ReusableText(
                      TextString: 'Search Course Here',
                      FontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget BottomNavBarWidget({
  required void Function(int index)? ontap,
}) {
  return CurvedNavigationBar(
    color: ColorCollections.SecondaryColor,
    backgroundColor: ColorCollections.PrimaryColor,
    items: <Widget>[
      Icon(
        Icons.home,
        size: 30,
        color: ColorCollections.WhiteColor,
      ),
      Icon(
        Icons.search,
        size: 30,
        color: ColorCollections.WhiteColor,
      ),
      Icon(
        Icons.note_add,
        size: 30,
        color: ColorCollections.WhiteColor,
      ),
      Icon(
        Icons.chat_rounded,
        size: 30,
        color: ColorCollections.WhiteColor,
      ),
    ],
    onTap: ontap,
  );
}

Widget DrowerWidget({
  required Map<String, dynamic>? alpha,
  required BuildContext context,
}) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/Images/DrawerBackgorund.jpg'))),
      ),
      Container(
        margin: EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    globalKey.currentState!.openDrawer();
                  },
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(43),
                      color: ColorCollections.SecondaryColor,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/icons/01.png'),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(2, 0),
                          color: ColorCollections.SecondaryColor,
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                ReusableText(
                  FromTop: 20,
                  TextString: alpha!['userName'],
                  FontSize: 22,
                  FromLeft: 10,
                  TextFontWeight: FontWeight.bold,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ],
            ),
            ReusableText(
              FromTop: 20,
              FromBottom: 0,
              TextString: 'Phone Number',
              FontSize: 22,
              TextFontWeight: FontWeight.bold,
              TextColor: ColorCollections.SecondaryColor,
            ),
            ReusableText(
              FromTop: 0,
              TextString: alpha!['userPhone'],
              FontSize: 22,
              TextFontWeight: FontWeight.w400,
              TextColor: ColorCollections.SecondaryColor,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/premium_page', (route) => false);
              },
              child: DrawerWidgets(
                color: Colors.blue,
                Text: 'Premium',
                iconText: 'premium',
                ImageType: 'png',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/settings_page');
              },
              child: DrawerWidgets(
                color: Colors.white,
                Text: 'Settings',
                iconText: 'settings',
                ImageType: 'png',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/help_page');
              },
              child: DrawerWidgets(
                color: Colors.white,
                Text: 'Help',
                iconText: 'help',
                ImageType: 'png',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/about_page');
              },
              child: DrawerWidgets(
                color: Colors.white,
                Text: 'About',
                iconText: 'about',
                ImageType: 'png',
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 10,
        child: InkWell(
          onTap: () async {
            CommonShowSnackBar(
                cancelOnTap: () {
                  Navigator.of(context).pop();
                },
                confirmOnTap: () {
                  authentication().logOutUser();
                  Global.storageServices
                      .setBool(AppConstants.STORAGE_DEVICE_OPENED_FIRST, false);
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (routes) => false);
                },
                context: context,
                TitleText: 'Are you sure You want to log out ?');
          },
          child: ReusableText(
            FontSize: 40,
            FromBottom: 20,
            FromLeft: 140,
            TextString: 'Log Out',
            TextColor: ColorCollections.WhiteColor,
            TextFontWeight: FontWeight.w900,
          ),
        ),
      ),
    ],
  );
}

Widget HomePageWidget({
  required BuildContext context,
  required String state,
  required int ind,
  required Map<String, dynamic>? alpha,
}) {
  return Scaffold(
    backgroundColor: ColorCollections.PrimaryColor,
    body: SafeArea(
      child: CustomScrollView(
        slivers: [
          //whole page
          SliverToBoxAdapter(
              child: titleBar(
            context,
            alpha: alpha,
          )),
          SliverToBoxAdapter(
            child: Center(
              child: ReusableText(
                TextString: 'Premium Courses',
                FontSize: 30,
                TextColor: ColorCollections.SecondaryColor,
                TextFontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 220,
              width: 366,
              child: PageView(
                onPageChanged: (index) {
                  context
                      .read<HomePageBloc>()
                      .add(CarouselSliderEvent(changedIndex: index));
                  print(index);
                },
                children: [
                  carouselSliderImage(carouselImage: PremiumImageList()[0]),
                  carouselSliderImage(carouselImage: PremiumImageList()[1]),
                  carouselSliderImage(carouselImage: PremiumImageList()[2]),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: DotsIndicator(
                position: ind,
                onTap: (index) {},
                dotsCount: 3,
                decorator: DotsDecorator(
                  activeSize: Size(15, 15),
                  size: Size(8, 8),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    context.read<HomePageBloc>().add(
                          BottomTabBarEvent(SelectedTab: 'all'),
                        );
                  },
                  child: AppButton(
                    ContainerColor: state == 'all'
                        ? ColorCollections.SecondaryColor
                        : Colors.grey.shade400,
                    ButtonText: 'All',
                    ButtonColor: ColorCollections.WhiteColor,
                    ButtonHeight: 40,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context
                        .read<HomePageBloc>()
                        .add(BottomTabBarEvent(SelectedTab: 'popular'));
                  },
                  child: AppButton(
                    ContainerColor: state == 'popular'
                        ? ColorCollections.SecondaryColor
                        : Colors.grey.shade400,
                    ButtonText: 'Popular',
                    ButtonColor: ColorCollections.WhiteColor,
                    ButtonHeight: 40,
                    ButtonWidth: 100,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context
                        .read<HomePageBloc>()
                        .add(BottomTabBarEvent(SelectedTab: 'newest'));
                  },
                  child: AppButton(
                    ContainerColor: state == 'newest'
                        ? ColorCollections.SecondaryColor
                        : Colors.grey.shade400,
                    ButtonText: 'Newest',
                    ButtonColor: ColorCollections.WhiteColor,
                    ButtonHeight: 40,
                    ButtonWidth: 100,
                  ),
                ),
              ],
            ),
          ),
          if (state == 'all') sliverWidget(ListOfImages: PremiumImageList()),
          if (state == 'popular')
            sliverWidget(ListOfImages: PremiumImageList()),
          if (state == 'newest') sliverWidget(ListOfImages: PremiumImageList()),
        ],
      ),
    ),
  );
}

Widget sliverWidget({
  required List<String> ListOfImages,
}) {
  return BlocConsumer<HomePageBloc, HomePageState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        sliver: SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildBuilderDelegate(
            childCount: ListOfImages.length,
            (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  context
                      .read<HomePageBloc>()
                      .add(SliverTabSliderEvent(changedIndex: index));
                  //just navigate to the pages with the arguments it needs
                },
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 180,
                      margin: EdgeInsets.only(right: 10, bottom: 5, top: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/Images/${ListOfImages[index]}.jpg',
                          ),
                        ),
                      ),
                    ),
                    ReusableText(
                      FromTop: 20,
                      TextString: ListOfImages[index],
                      FontSize: 20,
                      TextColor: ColorCollections.WhiteColor,
                      TextFontWeight: FontWeight.w900,
                    ),
                    Positioned(
                      bottom: 32,
                      child: ReusableText(
                        FromTop: 20,
                        TextString: 'best exam courses',
                        FontSize: 20,
                        TextColor: ColorCollections.WhiteColor,
                        TextFontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    },
  );
}

///////////////////////////////////////

// help widgets

//##################******************&&&&&&&&&^^^^^^^

///%^&&$$$$$$$@#@@@@@@@@@@@@$$$$$$$$$$$$$$$$
///
///
