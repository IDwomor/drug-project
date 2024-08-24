import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String obscureCharacter;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.obscureCharacter = '*',
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscuringCharacter: obscureCharacter,
      obscureText: obscureText,
      style: const TextStyle(
        color: Color(0xff691d2b),
        fontFamily: 'FiraSans',
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 12),
        constraints: BoxConstraints(
          maxHeight: height * 0.065,
          maxWidth: width,
        ),
        filled: true,
        fillColor: const Color(0xffd7d7d7),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xff691d2b),
          fontFamily: 'FiraSans',
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: const Color(0xff691d2b),
        suffixIcon: suffixIcon,
        suffixIconColor: const Color(0xff691d2b),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff691d2b),
            width: 10,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff691d2b),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xff691d2b),
          ),
        ),
      ),
    );
  }
}
