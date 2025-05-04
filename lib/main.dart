import 'package:flutter/material.dart';
import 'package:plexion/pages/home.dart';
import 'package:plexion/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const MyHomePage(),
    );
  }
}

