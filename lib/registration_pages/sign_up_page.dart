import 'package:flutter/material.dart';
import 'package:updated_drug_app/registration_pages/sign_in_page.dart';

import '../user_auth/firebase_auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/snack_bar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isObscureText = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    String res = await AuthService().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      confirmPassword: confirmPasswordController.text,
    );

    //if sign up is successful, user has to be created and navigate to the next screen
    //otherwise show the error message
    if (res == "success") {
      /*setState(() {
        isLoading = true;
      });*/
      //Navigate to the next screen
      Navigator.pushReplacementNamed(
        context,
        '/sign_in_page',
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffd7d7d7),
      appBar: AppBar(
        backgroundColor: const Color(0xff691d2b),
        title: const Text('Sign up'),
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
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/splash_image.png',
                width: 300,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: CustomTextField(
                controller: nameController,
                obscureText: false,
                hintText: "Name",
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(Icons.drive_file_rename_outline),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: CustomTextField(
                controller: emailController,
                obscureText: false,
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: CustomTextField(
                controller: passwordController,
                obscureText: isObscureText,
                hintText: "Enter password",
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: togglePassword(),
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: CustomTextField(
                controller: confirmPasswordController,
                obscureText: isObscureText,
                hintText: "Confirm password",
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: togglePassword(),
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              child: CustomButton(onPressed: signUpUser, text: "Sign up"),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Color(0xff691d2b),
                    fontSize: 13,
                    fontFamily: 'FiraSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()),
                    );
                  },
                  text: "Sign in",
                ),
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
