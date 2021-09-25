import 'package:facebook/bussines_logic/post_cubit.dart';
import 'package:facebook/presentation/widgets/contact_list.dart';
import 'package:facebook/presentation/widgets/custom_mobile_appbar.dart';
import 'package:facebook/presentation/widgets/custom_web_appbar.dart';
import 'package:facebook/presentation/widgets/more_options_list.dart';
import 'package:facebook/presentation/widgets/post_skeleton_container.dart';
import 'package:facebook/presentation/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:facebook/data/models/post.dart';
import 'package:facebook/data/repositry/data_repositry.dart';
import 'package:facebook/presentation/widgets/ceate_post_container.dart';
import 'package:facebook/presentation/widgets/post_container.dart';
import 'package:facebook/presentation/widgets/room.dart';
import 'package:facebook/presentation/widgets/stories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest>
    with SingleTickerProviderStateMixin {
  bool isLoading = true;
  final TrackingScrollController _trackingScrollController =
  TrackingScrollController();
  late TabController _tabController;

  List<Widget> screens(_trackingScrollController) {
    return [
      HomeMobileScreen(scrollController: _trackingScrollController),
      Scaffold(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
    ];
  }

  List<Widget> webPages(_trackingScrollController) {
    return [
      HomeWebView(scrollController: _trackingScrollController),
      Scaffold(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
    ];
  }

  final List<IconData> icons = [
    Icons.home,
    Icons.ondemand_video,
    FontAwesomeIcons.user,
    FontAwesomeIcons.users,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    BlocProvider.of<PostCubit>(context).delayForTwoSeconds();
    _tabController = TabController(
      initialIndex: 0,
      length: icons.length,
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Responsive.isDesktop(context)
                ? CustomWebAppbar(
                currentUser: currentUser,
                tabController: _tabController,
                icons: icons,
                onTap: (index) => setState(() => _selectedIndex = index),
                selectedIndex: _selectedIndex)
                : CustomMobileAppBar(
                currentUser: currentUser,
                tabController: _tabController,
                icons: icons,
                onTap: (index) => setState(() => _selectedIndex = index),
                selectedIndex: _selectedIndex),
          ];
        },
        body: TabBarView(
            controller: _tabController,
            children: Responsive.isDesktop(context)
                ? webPages(_trackingScrollController)
                : screens(_trackingScrollController)),
      ),
    );
  }


}

class HomeMobileScreen extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeMobileScreen({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
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
              return BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  if(state.isLoading){
                    return PostContainer(post:post!);
                  }
                 else{return PostSkeletonContainer(post: post!);}
                },
              );
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class HomeWebView extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeWebView({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 15.0, 0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(stories: stories, currentUser: currentUser),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: Room(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final Post? post = posts[index];
                  return  BlocBuilder<PostCubit, PostState>(
                      builder: (context, state) {
                        if(state.isLoading){
                          return PostContainer(post:post!);
                        }
                        else{return PostSkeletonContainer(post: post!);}
                      },
                    );
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: ContactList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
