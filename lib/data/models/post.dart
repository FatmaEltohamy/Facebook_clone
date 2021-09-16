import 'package:facebook/data/models/user.dart';
import 'package:flutter/cupertino.dart';

class Post {
  final User? user;
  final String caption;
  final String timeAgo;
  final String imgUrl;
  final int likes;
  final int comments;
  final int shares;

 const Post(
      {required this.user,
      required this.caption,
      required this.timeAgo,
      required this.imgUrl,
      required this.likes,
      required this.comments,
      required this.shares});
}
