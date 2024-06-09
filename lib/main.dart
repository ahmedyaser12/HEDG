import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}
//fake commit
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}
