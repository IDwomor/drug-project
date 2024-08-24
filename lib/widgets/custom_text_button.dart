import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;

  const CustomTextButton({super.key, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: const TextStyle(
            color: Color(0xff691d2b),
            fontFamily: 'FiraSans',
            fontWeight: FontWeight.bold,
            fontSize: 13),
      ),
    );
  }
}
