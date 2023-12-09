import 'package:flutter/material.dart';
import '/screens/home/home_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DoClean!',
      theme: buildThemeData(),
      home: const HomeScreen(),
    );
  }
}
