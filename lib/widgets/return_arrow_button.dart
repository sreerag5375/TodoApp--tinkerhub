import 'package:flutter/material.dart';

class ReturnArrowButton extends StatelessWidget {
  final Function onTap;
  const ReturnArrowButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              onTap();
            },
            child: Image.asset(
              'assets/icons/arrow-left.png',
            )),
      ],
    );
  }
}
