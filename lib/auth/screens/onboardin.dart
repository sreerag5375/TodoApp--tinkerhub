import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/const.dart';
import 'package:todo_app/utils/styles.dart';
import '/auth/tabs/onboarding_first_screen.dart';
import '/auth/tabs/onboarding_second_screen.dart';
import '/auth/tabs/onbording_third_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  bool onLastPage = false;
  bool onFirstPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.PADDING_INLINE),
        child: Stack(children: [
          PageView(
            onPageChanged: (value) {
              if (value == 2) {
                setState(() {
                  onLastPage = true;
                });
              }
              if (value == 0) {
                setState(() {
                  onFirstPage = true;
                });
              }
            },
            controller: _controller,
            children: const [
              OnboardingFirstScreen(),
              OnboardingSecondScreen(),
              OnboardingThirdScreen()
            ],
          ),
          Container(
            alignment: const Alignment(-1, -0.85),
            child: GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Text(
                  'SKIP',
                  style: TextStyle(
                      fontSize: AppSizes.TEXT_SIZE,
                      color: AppColors.SECONDARY_HEADING),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
                alignment: const Alignment(0, 0.78),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (onFirstPage) {
                            SystemNavigator.pop();
                          } else {
                            _controller.previousPage(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          }
                        },
                        child:  Text(
                          'BACK',
                          style: textStyleLightColor
                        )),
                    onLastPage
                        ? ElevatedButton(
                            style: primaryBtnStyle,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/loginSignUp');
                            },
                            child: const Text(
                              'DONE',
                              style: textStyle,
                            ))
                        : ElevatedButton(
                            style: primaryBtnStyle,
                            onPressed: () {
                              _controller.nextPage(
                                  duration: const Duration(microseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: const Text(
                              'NEXT',
                              style: textStyle,
                            ))
                  ],
                )),
          )
        ]),
      ),
    );
  }
}
