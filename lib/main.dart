import 'package:facebook/constants/my_colors.dart';
import 'package:facebook/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: MyColors.scaffold,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}




