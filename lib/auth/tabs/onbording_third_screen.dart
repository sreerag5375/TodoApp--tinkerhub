import 'package:flutter/material.dart';

class OnboardingThirdScreen extends StatelessWidget {
  const OnboardingThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "screen 3",
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
    );
  }
}
