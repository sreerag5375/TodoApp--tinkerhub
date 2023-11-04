import 'package:flutter/material.dart';
import '/utils/colors.dart';
import '/utils/styles.dart';

class FullWidthPrimaryButton extends StatelessWidget {
  final VoidCallback onpress;
  const FullWidthPrimaryButton({
    super.key,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.ASCENT_COLOR,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: const Text(
          'LOGIN',
          style: textStyle,
        ),
      ),
    );
  }
}
