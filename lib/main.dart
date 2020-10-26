import 'package:flutter/material.dart';
import 'package:flutter_health_bmi_calculator/home.dart';
import 'package:flutter_health_bmi_calculator/util/app_constant.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.white)),
      ),
      home: Home(title: kAPP_NAME),
    );
  }
}
