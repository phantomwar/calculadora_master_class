import 'package:flutter/material.dart';

class Constants {
  static final List<String> buttonList = [
    'CE',
    'C',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '='
  ];

  static const calculatorTextStyle =
      TextStyle(fontSize: 60, color: Colors.white, fontFamily: 'digital-7');

  static final regexNumber = RegExp(r'^[0-9.]');
  static final regexOperation = RegExp(r'[+\-*x=/]');
}
