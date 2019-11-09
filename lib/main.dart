import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0XFF0A0e21),
            primaryColor: Color(0XFF0A0e21),
            accentColor: Color(0XFFe0093b),
            textTheme: TextTheme(
                body1: TextStyle(
                    color: Colors.white
                )
            ),),
      home: InputPage(),
    );
  }
}


