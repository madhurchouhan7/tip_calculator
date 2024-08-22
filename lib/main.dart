import 'package:flutter/material.dart';
import 'package:tip_calculator/screens/main_screen.dart';

//main method, entry point of the app.
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tip Calculator',
      theme: ThemeData(brightness: Brightness.dark),
      home: const MainScreen(),
    );
  }
}
