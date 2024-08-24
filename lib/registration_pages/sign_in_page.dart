import 'package:flutter/material.dart';
import 'package:updated_drug_app/registration_pages/sign_up_page.dart';

import '../user_auth/firebase_auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/snack_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscureText = false;
  bool? isChecked = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /*void logInUser() async {
    String res = await AuthService().logInUser(
        email: emailController.text, password: passwordController.text);

    //if log in is successful, user should navigate to the next screen
    //otherwise show the error message
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffd7d7d7),
      appBar: AppBar(
        backgroundColor: const Color(0xff691d2b),
        title: const Text('Sign in'),
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Image.asset(
                'assets/images/splash_image.png',
                width: 500,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: CustomTextField(
                controller: emailController,
                obscureText: false,
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: "Type your email",
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomTextField(
                controller: passwordController,
                obscureText: isObscureText,
                hintText: "Type your password",
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: togglePassword(),
                keyboardType: TextInputType.text,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 82),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: const Color(0xffd7d7d7),
                          focusColor: const Color(0xff691d2b),
                          activeColor: const Color(0xff691d2b),
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xff691d2b),
                          ),
                          value: isChecked,
                          onChanged: (newBool) {
                            setState(() {
                              isChecked = newBool;
                            });
                          },
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(
                              color: Color(0xff691d2b),
                              fontFamily: 'FiraSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    onPressed: () {},
                    text: "Forgot password",
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: CustomButton(onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              }, text: "Sign in"),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Color(0xff691d2b),
                      fontFamily: 'FiraSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                CustomTextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    text: "Sign up"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          isObscureText = !isObscureText;
        });
      },
      icon: isObscureText
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off_outlined),
    );
  }
}
