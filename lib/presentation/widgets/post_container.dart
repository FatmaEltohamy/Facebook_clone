import 'package:facebook/constants/my_colors.dart';
import 'package:facebook/data/models/post.dart';
import 'package:facebook/presentation/widgets/profile_avatar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'responsive.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDeskTop = Responsive.isDesktop(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
         clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: isDeskTop ? 5.0 : 0.0,),
        elevation: isDeskTop ? 1.0 : 0.0,
        shape: isDeskTop
            ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )
            : null,
        child: Container(

          // margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.symmetric(vertical: 10.0),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _PostHeader(post: post),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text('${post.caption}'),
                    post.imgUrl != ''
                        ? const SizedBox.shrink()
                        : const SizedBox(
                            height: 6.0,
                          )
                  ],
                ),
              ),
              post.imgUrl != ''
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CachedNetworkImage(imageUrl: post.imgUrl),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: _PostState(post: post),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imgUrl: post.user!.imgUrl,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user!.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => print('more'),
          icon: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

class _PostState extends StatelessWidget {
  final Post post;

  const _PostState({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: MyColors.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} Comments ',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                Icons.thumb_up_alt_outlined,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              onTap: () => print('like'),
            ),
            _PostButton(
              icon: Icon(
                Icons.chat_bubble_outline_sharp,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () => print('like'),
            ),
            _PostButton(
              icon: Icon(
                FontAwesomeIcons.share,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Share',
              onTap: () => print('like'),
            ),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function() onTap;

  const _PostButton(
      {Key? key, required this.icon, required this.onTap, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  label,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



