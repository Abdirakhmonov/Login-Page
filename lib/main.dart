import 'package:flutter/material.dart';
import 'package:lesson_36/lesson_1.dart';
import 'package:lesson_36/pages/create_account.dart';
import 'package:lesson_36/pages/duration_page.dart';
import 'pages/last_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
