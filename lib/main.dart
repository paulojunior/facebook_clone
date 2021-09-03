import 'package:fb_clone/uteis/theme.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: ThemeColors.scaffold),
      home: Home(),
    );
  }
}