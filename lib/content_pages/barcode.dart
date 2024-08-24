import 'package:flutter/material.dart';

class Barcode extends StatefulWidget {
  const Barcode({super.key});

  @override
  State<Barcode> createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffd7d7d7),
      appBar: AppBar(
        backgroundColor: const Color(0xff691d2b),
        title: const Text('Barcode'),
        titleTextStyle: const TextStyle(
          color: Color(0xffd7d7d7),
          fontSize: 20,
          fontFamily: 'FiraSans',
          fontWeight: FontWeight.bold,
          letterSpacing: 5,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
      ),
    );
  }
}
