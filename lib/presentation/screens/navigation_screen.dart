// import 'package:facebook/presentation/widgets/custom_tab_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import 'home_screen.dart';
// class NavScreen extends StatefulWidget {
//   const NavScreen({Key? key}) : super(key: key);
//
//   @override
//   _NavScreenState createState() => _NavScreenState();
// }
//
// class _NavScreenState extends State<NavScreen> {
//   final List<Widget> screens=[
//     HomeScreen(),
//     Scaffold(),
//     Scaffold(),
//     Scaffold(),
//     Scaffold(),
//   ];
//   final List<IconData> icons=[
//     Icons.home,
//     Icons.ondemand_video,
//     FontAwesomeIcons.user,
//     FontAwesomeIcons.users,
//     Icons.menu,
//   ];
//   int _selectedIndex=0;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length:icons.length
//         ,child: Scaffold(
//       body: screens[_selectedIndex],
//       bottomNavigationBar: CustomTabBar(icons:icons,selectedIndex:_selectedIndex,
//       onTap:(index)=> setState(()=> _selectedIndex=index) ,),
//     ));
//   }
// }
