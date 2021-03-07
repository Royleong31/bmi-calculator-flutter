import 'package:flutter/material.dart';
import './input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
    );
  }
}

// theme: ThemeData(
//   primaryColor: Color(0xff0a0e21),
//   accentColor: Colors.purple,
//   scaffoldBackgroundColor: Color(0xff0a0e21),
//   textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
// ),
