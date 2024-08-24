import 'package:flutter/material.dart';
import 'package:updated_drug_app/registration_pages/sign_in_page.dart';
import 'package:updated_drug_app/registration_pages/sign_up_page.dart';

import '../widgets/custom_button.dart';

class RegistrationOptionsPage extends StatefulWidget {
  const RegistrationOptionsPage({super.key});

  @override
  State<RegistrationOptionsPage> createState() =>
      _RegistrationOptionsPageState();
}

class _RegistrationOptionsPageState extends State<RegistrationOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff691d2b),
      appBar: AppBar(
        backgroundColor: const Color(0xffd7d7d7),
        title: const Text('Drug App'),
        titleTextStyle: const TextStyle(
            color: Color(0xff691d2b),
            fontSize: 20,
            fontFamily: 'FiraSans',
            fontWeight: FontWeight.bold,
            letterSpacing: 5),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(200),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_image.png'),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()),
                    );
                  },
                  text: "Sign in"),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  text: "Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
