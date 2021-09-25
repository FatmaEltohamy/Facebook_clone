import 'package:facebook/bussines_logic/post_cubit.dart';
import 'package:facebook/constants/my_colors.dart';
import 'package:facebook/presentation/screens/home_screen.dart';
import 'package:facebook/presentation/screens/home_screen.dart';
import 'package:facebook/presentation/screens/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
      create: (context) => PostCubit(),
      child: MaterialApp(
        title: 'Facebook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: MyColors.scaffold,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeTest(),
      ),
    );
  }
}




