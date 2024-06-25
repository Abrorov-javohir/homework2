
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uy_ishi/screens/home_screens.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
