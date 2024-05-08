import 'package:calculadora_master_class/constants/buttons_list.dart';
import 'package:flutter/material.dart';

class CalculatorController extends ChangeNotifier {
  String? value1;
  String? value2;
  String? operation;
  String? lastOperation;
  String? display;

  void clean() {
    operation = null;
    display = null;
    lastOperation = null;
    value1 = null;
    value2 = null;

    notifyListeners();
  }

  void iqualOperation(String value) {
    value2 = value;
    lastOperation = '$lastOperation$value';
    display = mathOperations(operation!, value1!, value2!);
    value1 = null;
    value2 = null;
    operation = null;

    notifyListeners();
  }

  void addValue1({required String buttonValue}) {
    operation = buttonValue;
    value1 = display;
    lastOperation = '$value1$operation';
    display = null;
  }

  void cleanValue(String value) {
    if (value == 'C' || value == 'c') {
      display = null;
      notifyListeners();
    } else if (value == 'CE') {
      clean();
    }
  }

  void listemButtonValue(String buttonValue) {
    if (buttonValue.contains(Constants.regexNumber)) {
      display = display == null ? buttonValue : '$display$buttonValue';
    } else if (buttonValue.contains(Constants.regexOperation)) {
      if (buttonValue.contains('=') && value1 != null) {
        iqualOperation(display!);
      } else if (value1 == null && buttonValue != '=') {
        addValue1(buttonValue: buttonValue);
        // } else if (value2 == null) {
        //   value2 = display;
        //   iqualOperation(value2!);
        //   operation = buttonValue;
        //   display = '$display$buttonValue';
      }
    } else if (buttonValue == 'C' || buttonValue == 'CE') {
      cleanValue(buttonValue);
    }
    notifyListeners();
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
