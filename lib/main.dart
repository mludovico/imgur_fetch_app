import 'package:flutter/material.dart';
import 'package:imgurfetchapp/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mludovico\'s Imgur fetcher',
      home: MainScreen()
    );
  }
}