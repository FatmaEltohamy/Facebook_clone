import 'package:facebook/constants/my_colors.dart';
import 'package:facebook/data/models/user.dart';
import 'package:facebook/data/repositry/data_repositry.dart';
import 'package:facebook/presentation/widgets/circle_button.dart';
import 'package:facebook/presentation/widgets/custom_tab_bar.dart';
import 'package:facebook/presentation/widgets/profile_avatar.dart';
import 'package:facebook/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomWebAppbar extends StatefulWidget {
  final User currentUser;
  final TabController tabController;
  final List<IconData> icons;
  final Function(int) onTap;
  final int selectedIndex;

  const CustomWebAppbar({
    Key? key,
    required this.currentUser,
    required this.tabController,
    required this.icons,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);
  @override
  _CustomWebAppbarState createState() => _CustomWebAppbarState();
}

class _CustomWebAppbarState extends State<CustomWebAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leadingWidth: 140.0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Text(
          'facebook',
          style: const TextStyle(
            color: MyColors.facebookBlue,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
        ),
      ),
      title: PreferredSize(
        preferredSize: const Size.fromHeight(double.infinity),
        child: CustomTabBar(
          tabController: widget.tabController,
          icons: widget.icons,
          selectedIndex:widget. selectedIndex,
          onTap:widget.onTap
        ),
      ),
      centerTitle: true,
      floating: true,
      pinned: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: UserCard(currentUser:widget.currentUser),
        ),
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
    );
  }
}










// class CustomAppbar extends StatelessWidget {
//   final User currentUser;
//   final TabController tabController;
//   final List<IconData> icons;
//   final Function() onTap;
//   final int selectedIndex;
//
//   const CustomAppbar({
//     Key? key,
//     required this.currentUser,
//     required this.tabController,
//     required this.icons,
//     required this.onTap,
//     required this.selectedIndex,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       brightness: Brightness.light,
//       backgroundColor: Colors.white,
//       leadingWidth: 140.0,
//       leading: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
//         child: Text(
//           'facebook',
//           style: const TextStyle(
//             color: MyColors.facebookBlue,
//             fontSize: 28.0,
//             fontWeight: FontWeight.bold,
//             letterSpacing: -1.2,
//           ),
//         ),
//       ),
//       title: PreferredSize(
//         preferredSize: const Size.fromHeight(48.3),
//         child: CustomTabBar(
//           tabController: tabController,
//           icons: icons,
//           selectedIndex: selectedIndex,
//           onTap: (index) => setState(() => selectedIndex = index),
//         ),
//       ),
//       centerTitle: true,
//       floating: true,
//       pinned: true,
//       actions: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0),
//           child: GestureDetector(
//             onTap: () => print('go to profile'),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                     radius: 18.0,
//                     child: ProfileAvatar(imgUrl: currentUser.imgUrl)),
//                 SizedBox(
//                   width: 4.0,
//                 ),
//                 Text(
//                   currentUser.name,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w200,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         CircleButton(
//           icon: Icons.search,
//           iconSize: 25.0,
//           onPressed: () => print('ff'),
//         ),
//         CircleButton(
//           icon: FontAwesomeIcons.facebookMessenger,
//           iconSize: 23,
//           onPressed: () => print('ff'),
//         ),
//       ],
//     );
//   }
// }
