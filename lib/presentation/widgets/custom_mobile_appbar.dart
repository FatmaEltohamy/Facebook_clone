import 'package:facebook/constants/my_colors.dart';
import 'package:facebook/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'circle_button.dart';
import 'custom_tab_bar.dart';

class CustomMobileAppBar extends StatefulWidget {

  final User currentUser;
  final TabController tabController;
  final List<IconData> icons;
  final Function(int) onTap;
  final int selectedIndex;

  const CustomMobileAppBar({Key? key,
    required this.currentUser,
    required this.tabController,
    required this.icons,
    required this.onTap,
    required this.selectedIndex,}) : super(key: key);
  @override
  _CustomMobileAppBarState createState() => _CustomMobileAppBarState();
}

class _CustomMobileAppBarState extends State<CustomMobileAppBar> {
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: Text(
        'facebook',
        style: const TextStyle(
          color: MyColors.facebookBlue,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.2,
        ),
      ),
      centerTitle: false,
      floating: true,
      pinned: true,
      actions: [
        CircleButton(
          icon: Icons.search,
          iconSize: 25.0,
          onPressed: () => print('ff'),
        ),
        CircleButton(
          icon: FontAwesomeIcons.facebookMessenger,
          iconSize: 23,
          onPressed: () => print('ff'),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.3),

        child: CustomTabBar(
          tabController: widget.tabController,
          icons: widget.icons,
          selectedIndex: widget.selectedIndex,
          onTap: widget.onTap

        ),
      ),
    );
  }
}
