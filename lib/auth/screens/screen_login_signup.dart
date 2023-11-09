import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/services/functions/login_signup_functions.dart';
import '/widgets/outlined_btn_full_width.dart';
import '/widgets/full_width_primary_btn.dart';
import '/widgets/return_arrow_button.dart';
import '/utils/colors.dart';
import '/utils/const.dart';
import '/utils/styles.dart';
import '/widgets/spacing.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
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
                // back arrow button
                ReturnArrowButton(onTap: () {
                  SystemNavigator.pop();
                }),
                const Spacing(height: 58),
                // main heading
                Text(
                  'Welcome to UpTodo',
                  style: mainHeadingStyle,
                ),
                // description
                const Spacing(height: 26),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Please login to your account or create new account to continue',
                    style: textStyleLightColor,
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacing(height: screenHeight * 0.44),
                // login button
                FullWidthPrimaryButton(
                    onpress: () => goToLoginPage(context: context)),
                const Spacing(height: 20),
                // create account page
                FullWidthOutlinedButton(
                    onPress: () => goToCreateAccountPage(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
