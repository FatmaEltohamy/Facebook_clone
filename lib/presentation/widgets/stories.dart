import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/constants/my_colors.dart';
import 'package:facebook/data/models/story.dart';
import 'package:facebook/data/models/user.dart';
import 'package:facebook/presentation/widgets/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User? currentUser;
  final List<Story>? stories;

  const Stories({Key? key, this.currentUser, this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          itemCount: 1 + stories!.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: _CartStory(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            final Story story = stories![index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _CartStory(
                story: story,
              ),
            );
          }),
    );
  }
}

class _CartStory extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  const _CartStory(
      {Key? key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser!.imgUrl : story!.imgUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: MyColors.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.add,
                      color: MyColors.facebookBlue,
                    ),
                    onPressed: () => print('add story'),
                  ),
                )
              : ProfileAvatar(
                  imgUrl: story!.user!.imgUrl,
                  hasBorder: !story!.isViewed,
                ),
        ),
        Positioned(
          bottom: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add Story' : '${story!.user!.name}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow:TextOverflow.ellipsis ,
          ),
        ),
      ],
    );
  }
}
