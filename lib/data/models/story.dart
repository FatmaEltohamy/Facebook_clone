import 'package:facebook/data/models/user.dart';
import 'package:flutter/cupertino.dart';

class Story {
  final User? user;
  final String imgUrl;
  final bool isViewed;

 const Story({required this.user, required this.imgUrl, required this.isViewed});
}
