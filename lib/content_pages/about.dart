import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffd7d7d7),
      appBar: AppBar(
        backgroundColor: const Color(0xff691d2b),
        title: const Text('About'),
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
