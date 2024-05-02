import 'package:calculadora_master_class/pages/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import '../constants/buttons_list.dart';
import 'widgets/custom_buttons.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final controller = CalculatorController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double buttonHeight = size.height * 0.1;
    double buttonWidth = size.width * 0.22;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Calculadora v0.0.1'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
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
                          style: Constants.calculatorTextStyle
                              .copyWith(fontSize: 18),
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
                          controller.result ?? '0',
                          textAlign: TextAlign.end,
                          style: Constants.calculatorTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                children: [
                  Wrap(direction: Axis.horizontal, children: [
                    for (int i = 0; i < Constants.buttonList.length; i++)
                      CustomButtons(
                          height: buttonHeight,
                          width: buttonWidth,
                          buttonText: Constants.buttonList[i],
                          onPressed: () => {
                                controller
                                    .listemButtonValue(Constants.buttonList[i])
                              }),
                  ])
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
