import 'package:flutter/material.dart';

class CalculatorController extends ChangeNotifier {
  String? value1;
  String? value2;
  String? result;
  String? lastResult;
  String? operation;
  String? lastOperation;
  bool isAnotherOperation = false;

  final regexNumber = RegExp(r'^[0-9.]');
  final regexOperation = RegExp(r'[+\-*/]');

  void clean() {
    result = null;
    operation = null;
    lastOperation = null;
    value1 = null;
    value2 = null;
    lastResult = null;

    notifyListeners();
  }

  void iqualOperation() {
    value2 = result;
    lastOperation = '$lastOperation $value2';
    result = mathOperations(operation!, value1!, value2!);
    lastResult = result;
    value1 = null;
    value2 = null;
    operation = null;

    notifyListeners();
  }

  void cleanValue(String value) {
    if (value == 'C') {
      result = '0';
      lastOperation = 0.toString();
    } else if (value == 'CE') {
      clean();
    }
  }

  void listemButtonValue(String buttonValue) {
    if (buttonValue.contains(regexNumber)) {
      result = (result ?? '') + buttonValue;
      notifyListeners();
    } else if (buttonValue.contains(regexOperation) || buttonValue == 'x') {
      value1 = result;
      operation = buttonValue;
      lastOperation = (result ?? '') + buttonValue;
      result = '';
      notifyListeners();
    } else if (buttonValue.contains(regexOperation) || buttonValue == 'x') {
      value1 = result;
      operation = buttonValue;
      lastOperation = (result ?? '') + buttonValue;
      result = '';
      notifyListeners();
    } else if (buttonValue == '=' && operation != null && value1 != null) {
      iqualOperation();
    } else if (buttonValue == 'C' || buttonValue == 'CE') {
      clean();
    }
  }
}

String mathOperations(String operation, String value1, String value2) {
  switch (operation) {
    case '+':
      return (double.parse(value1) + double.parse(value2)).toString();
    case '-':
      return (double.parse(value1) - double.parse(value2)).toString();
    case 'x':
      return (double.parse(value1) * double.parse(value2)).toString();
    case '/':
      return (double.parse(value1) / double.parse(value2)).toString();
  }
  return 'Error';
}
