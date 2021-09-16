import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/data/models/user.dart';
import 'package:facebook/presentation/widgets/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imgUrl: (currentUser.imgUrl),),
              // CircleAvatar(
              //   radius: 25.0,
              //   backgroundColor: Colors.grey[200],
              //   backgroundImage: CachedNetworkImageProvider(currentUser.imgUrl),
              // ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  // color: Colors.orange,
                   height: 40,
                  child: TextField(
                    textAlignVertical:TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                     border:OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30)
                     ),
                      alignLabelWithHint: false,
                        hintText: 'What\'s on your mind?',
                      hintStyle: TextStyle(color: Colors.black),
                      ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 13.0,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => print('live'),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Live',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(width: 8.0,thickness: 0.5,),
                TextButton.icon(
                  onPressed: () => print('live'),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text(
                    'Photo',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: () => print('live'),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.deepPurple,
                  ),
                  label: Text(
                    'Room',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }
}
