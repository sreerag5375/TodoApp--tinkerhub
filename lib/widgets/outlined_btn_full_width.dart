import 'package:flutter/material.dart';
import '/utils/colors.dart';
import '/utils/styles.dart';

class FullWidthOutlinedButton extends StatelessWidget {
  final VoidCallback onPress;
  const FullWidthOutlinedButton({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.ASCENT_COLOR),
              padding: const EdgeInsets.symmetric(vertical: 12)),
          onPressed: onPress,
          child: const Text(
            'CREATE ACCOUNT',
            style: textStyle,
          )),
    );
  }
}
