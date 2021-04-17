import 'package:flutter/material.dart';
import './input_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        accentColor: Colors.brown,
        scaffoldBackgroundColor: Colors.black45,
      ),
      home: InputPage(),
    );
  }
}






