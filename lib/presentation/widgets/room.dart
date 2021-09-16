import 'dart:ui';

import 'package:facebook/constants/my_colors.dart';
import 'package:facebook/data/models/user.dart';
import 'package:facebook/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Room extends StatelessWidget {
  final List<User?> onlineUsers;

  const Room({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User? user=onlineUsers[index-1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(imgUrl: user!.imgUrl,isActive:true),
            );
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('create room '),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                MyColors.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 30.0,
              color: Colors.white,
            ),
          ),
         const SizedBox(width:4.0 ,),
          Text('Create\nRoom',style: TextStyle(fontWeight: FontWeight.bold),),

        ],
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (_) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (_) => BorderSide(color: Colors.lightBlue, width: 3.0),
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (_) => TextStyle(color: MyColors.facebookBlue),
        ),
      ),
    );
  }
}
