import 'package:calculadora_master_class/pages/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Master CLass',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Calculadora(),
    );
  }
}
