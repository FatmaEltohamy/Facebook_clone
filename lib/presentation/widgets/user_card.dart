import 'package:facebook/data/models/user.dart';
import 'package:facebook/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User currentUser;

  const UserCard({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>print('user cars'),
      child: Row(
         mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
              radius: 18.0, child: ProfileAvatar(imgUrl: currentUser.imgUrl)),
          SizedBox(
            width: 6.0,
          ),
          Flexible(
            child: Text(
              currentUser.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                color: Colors.black,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
