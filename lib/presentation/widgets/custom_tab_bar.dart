import 'package:facebook/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'responsive.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final TabController tabController;

  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(

        isScrollable: Responsive.isDesktop(context) ? true : false,
        unselectedLabelColor: Colors.grey,
        labelColor: MyColors.facebookBlue,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 3.0),
        indicator: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: MyColors.facebookBlue, width: 3.0),
        )),
        controller: tabController,
        tabs: icons
            .map((e) => Tab(
                  icon: Container(
                    width: 69.0,
                    // padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      e,
                      size: 26.0,
                    ),
                  ),

                ))
            .toList());
  }
}
