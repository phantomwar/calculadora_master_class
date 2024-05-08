// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculadora_master_class/constants/buttons_list.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    super.key,
    required this.buttonText,
    required this.height,
    required this.width,
    this.onPressed,
  });
  final String buttonText;
  final double height;
  final double width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: buttonText == '=' ? 2 * width + 10 : width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
            color: buttonText.contains(Constants.regexNumber)
                ? Colors.grey[850]
                : Colors.blue[900],
          ),
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
