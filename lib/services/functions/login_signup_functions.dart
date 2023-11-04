import 'package:flutter/material.dart';

goToLoginPage({required BuildContext context}) {
  Navigator.pushNamed(context, '/loginScreen');
}

goToCreateAccountPage(BuildContext context) {
  Navigator.pushNamed(context, '/createAccountScreen');
}
