import 'package:flutter/material.dart';
import 'grades_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grades App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const GradesPage(),
    );
  }
}