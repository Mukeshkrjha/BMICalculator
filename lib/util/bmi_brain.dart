import 'dart:math';

import 'package:flutter/cupertino.dart';

class BMIBrain {
  BMIBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'OVERWEIGHT';
    else if (_bmi > 18.5)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }

  String getCorelation() {
    if (_bmi >= 25)
      return 'You are higher than normal body weight. Try to excercise more';
    else if (_bmi > 18.5)
      return 'You have normal body weight. Good job!!!';
    else
      return 'You are lower than normal body weight. Try eating more and gain weight.';
  }
}
