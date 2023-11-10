import 'package:flutter/material.dart';
import 'package:todo_app/auth/screens/screen_create_account.dart';

// Function for splash screen: Navigate to the onboarding screen after a delay of 3s
Future<void> navigateToOnboarding(BuildContext context) async {
  final status = await checkLoginPref(stringKey: "loginStatus");
  Future.delayed(const Duration(seconds: 3), () {
    print("STATUS--- $status");
    if (status == 'noValue') {
      print('on bording');
      Navigator.of(context).pushReplacementNamed('/onboarding');
    }
    if (status == 'accCreated') {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/loginScreen');
    } else if (status == 'loggedin') {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/home');
    }
  });
}
