import 'package:exam_collector/Pages/HomePage/blocs/homePageBloc.dart';
import 'package:exam_collector/Pages/HomePage/blocs/homePageEvent.dart';
import 'package:exam_collector/Pages/HomePage/blocs/homePageState.dart';
import 'package:exam_collector/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/homePageWidget.dart';

class home_page extends StatefulWidget {
  final Map<String, dynamic>? alpha;
  const home_page({
    this.alpha,
    super.key,
  });

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrowerWidget(
          alpha: widget.alpha,
          context: context,
        ),
      ),
      key: globalKey,
      body: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // if (state is BottomTabBarState) {
          //   // print(state);
          // }
          return bottomNavBarPages(
                  alpha: widget.alpha,
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
          context
              .read<HomePageBloc>()
              .add(BottomNavBarEvent(SelectedIndex: index));
        },
      ),
    );
  }
}
