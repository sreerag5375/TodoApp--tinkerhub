import 'package:flutter/material.dart';

void navigateToLogin({required BuildContext context}) {
  Navigator.of(context).pushReplacementNamed('/loginScreen');
}

void navigateToNextPage({required PageController controller}) {
  controller.nextPage(
      duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
}

void navigateToPreviousPage({required PageController controller}) {
  controller.previousPage(
      duration: const Duration(milliseconds: 500), curve: Curves.easeInBack);
}
