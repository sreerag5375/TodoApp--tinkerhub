import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/pages/screens/add.dart';
import '/auth/screens/screen_create_account.dart';
import '/auth/screens/screen_login.dart';
import '/firebase_options.dart';
import '/pages/screens/screen_home.dart';
import '/auth/screens/onboardin.dart';
import '/auth/screens/screen_login_signup.dart';
import '/auth/screens/screen_splash.dart';
import '/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Task Manager',
      theme: ThemeData(
        fontFamily: 'lato',
        primaryColor: AppColors.ASCENT_COLOR,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/loginSignUp': (context) => const LoginSignUpScreen(),
        '/loginScreen': (context) =>  LoginScreen(),
        '/createAccountScreen': (context) =>  CreateAccountScreen(),
        '/home': (context) =>  HomeScreen(),
        '/addTask': (context) => AddScreen()
      },
    );
  }
}
