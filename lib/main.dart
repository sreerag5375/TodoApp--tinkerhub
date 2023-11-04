// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/screens/screen_create_account.dart';
import 'package:todo_app/auth/screens/screen_login.dart';
import '/auth/screens/onboardin.dart';
import '/auth/screens/screen_login_signup.dart';
import '/auth/screens/screen_splash.dart';
import '/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        fontFamily: 'lato',
        primaryColor: AppColors.ASCENT_COLOR,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/loginSignUp': (context) => const LoginSignUpScreen(),
        '/loginScreen': (context) => const LoginScreen(),
        '/createAccountScreen': (context) => const CreateAccountScreen()
      },
    );
  }
}
