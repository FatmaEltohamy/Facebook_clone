import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/constants/my_colors.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imgUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({Key? key, this.isActive = false, required this.imgUrl,this.hasBorder=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: 25.0,
        backgroundColor: MyColors.facebookBlue,
        child: CircleAvatar(
          radius: hasBorder?22.0:25.0,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(imgUrl),
        ),
      ),
    isActive?  Positioned(
        bottom: 0.0,
        right: 0.0,
        child: Container(
          width: 15.0,
          height: 15.0,
          decoration: BoxDecoration(
            color: MyColors.online,
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.0,
              color: Colors.white,
            )
          ),

        ),
      ):const SizedBox.shrink(),
    ]);
  }
}
