import 'package:facebook/constants/my_colors.dart';
import 'package:facebook/data/models/post.dart';
import 'package:facebook/data/repositry/data_repositry.dart';
import 'package:facebook/presentation/widgets/ceate_post_container.dart';
import 'package:facebook/presentation/widgets/circle_button.dart';
import 'package:facebook/presentation/widgets/post_container.dart';
import 'package:facebook/presentation/widgets/room.dart';
import 'package:facebook/presentation/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print('ff'),
              ),
              CircleButton(
                icon: FontAwesomeIcons.facebookMessenger,
                iconSize: 24,
                onPressed: () => print('ff'),
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser)),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Room(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Stories(stories: stories, currentUser: currentUser),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) {
              final Post? post = posts[index];
              return PostContainer(post:post!);
            },
              childCount: posts.length,

            ),
          ),
        ],
      ),
    );
  }
}
