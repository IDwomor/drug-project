import 'package:flutter/material.dart';
import '../registration_pages/registration_option_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationOptionsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff691d2b),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 300,
            width: 300,
            child: Image.asset(
              'assets/images/splash_image.png',
            ),
          ),
          const SizedBox(height: 100),
          Container(
              child: const Text("Drug App",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'FiraSans',
                      letterSpacing: 5,
                      color: Color(0xffd7d7d7))))
        ])));
  }
}
