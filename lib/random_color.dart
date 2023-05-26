import 'package:flutter/material.dart';
import 'package:test_application/core/utils/app_string.dart';

import 'module/home/view/home_screen.dart';

class RandomColor extends StatelessWidget {
  const RandomColor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
