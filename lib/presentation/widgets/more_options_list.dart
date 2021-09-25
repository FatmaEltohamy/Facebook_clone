import 'package:facebook/constants/my_colors.dart';
import 'package:facebook/data/models/user.dart';
import 'package:facebook/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';


class MoreOptionsList extends StatelessWidget {
  final User currentUser;
  final List<List> _moreOptionsList = const [
    [Mdi.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [Mdi.accountMultiple, Colors.cyan, 'Friends'],
    [Mdi.facebookMessenger, MyColors.facebookBlue, 'Messenger'],
    [Mdi.flag, Colors.orange, 'Pages'],
    [Mdi.storefront, MyColors.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, MyColors.facebookBlue, 'Watch'],
    [Mdi.calendarStar, Colors.red, 'Events'],
  ];

  const MoreOptionsList({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(
                currentUser: currentUser,
              ),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: _Option(icon: option[0], color: option[1], label: option[2]),
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option(
      {Key? key, required this.icon, required this.color, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30.0,
            color: color,
          ),
          SizedBox(
            width: 6.0,
          ),
          Flexible(
            child: Text(
              label,
              style: TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,

            ),
          ),
        ],
      ),
    );
  }
}
