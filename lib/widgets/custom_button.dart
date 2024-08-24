import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;

  const CustomButton({super.key, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        side: const WidgetStatePropertyAll(
            BorderSide(width: 0, color: Color(0xff691d2b))),
        backgroundColor: const WidgetStatePropertyAll(Color(0xffd7d7d7)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            color: Color(0xff691d2b),
            fontFamily: 'FiraSans',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
      child: Text(
        text!,
      ),
    );
  }
}
