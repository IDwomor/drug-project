//import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:updated_drug_app/registration_pages/registration_option_screen.dart';
import 'package:updated_drug_app/registration_pages/sign_in_page.dart';
import 'package:updated_drug_app/registration_pages/sign_up_page.dart';

import 'content_pages/dashboard.dart';
import 'features/splash.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /*await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/registration_option_screen': (context) => const RegistrationOptionsPage(),
        '/sign_in_page': (context) => const SignInPage(),
        '/sign_up_page': (context) => const SignUpPage(),
        '/dashboard': (context) => const Dashboard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
