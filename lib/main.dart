import 'package:flutter/material.dart';
import 'package:th_signlang/pages/home.dart';
import 'package:th_signlang/pages/splash_screen.dart';

void main() => runApp(MyApp());

// FBBC1B
class MyApp extends StatelessWidget {
  // static final String title = 'Pick Image & Video';

  @override
  Widget build(BuildContext context) => MaterialApp(
    // title: title,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  );
}