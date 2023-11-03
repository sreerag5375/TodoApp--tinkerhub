import 'package:flutter/material.dart';

// Function for splash screen: Navigate to the onboarding screen after a delay of 3s
Future<void> navigateToOnboarding(BuildContext context) async {
  Future.delayed(const Duration(seconds: 3), () {
    Navigator.of(context).pushReplacementNamed('/onboarding');
  });
}
