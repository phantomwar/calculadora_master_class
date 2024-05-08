import 'package:flutter/material.dart';
import '../../constants/buttons_list.dart';
import '../controller/calculator_controller.dart';

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final CalculatorController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.2,
      width: size.width * 0.95,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topRight,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    controller.lastOperation ?? '0',
                    textAlign: TextAlign.end,
                    style: Constants.calculatorTextStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    controller.display ?? '0',
                    textAlign: TextAlign.end,
                    style: Constants.calculatorTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
