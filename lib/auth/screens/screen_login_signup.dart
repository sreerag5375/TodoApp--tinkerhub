import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/const.dart';
import 'package:todo_app/utils/styles.dart';
import 'package:todo_app/widgets/spacing.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double _ScreenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.PADDING_INLINE),
        child: Scaffold(
          backgroundColor: AppColors.PRIMARY_COLOR,
          body: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                const Spacing(height: 12),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Image.asset(
                          'assets/icons/arrow-left.png',
                        )),
                  ],
                ),
                const Spacing(height: 58),
                Text(
                  'Welcome to UpTodo',
                  style: mainHeadingStyle,
                ),
                const Spacing(height: 26),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Please login to your account or create new account to continue',
                    style: textStyleLightColor,
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacing(height: _ScreenHeight * 0.44),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.ASCENT_COLOR,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: textStyle,
                    ),
                  ),
                ),
                const Spacing(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.ASCENT_COLOR),
                          padding: const EdgeInsets.symmetric(vertical: 12)),
                      onPressed: () {},
                      child: const Text(
                        'CREATE ACCOUNT',
                        style: textStyle,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
