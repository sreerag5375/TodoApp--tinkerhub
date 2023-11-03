import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double height;
  const Spacing({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
