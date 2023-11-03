import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/utils/data.dart';
import 'package:todo_app/widgets/spacing.dart';
import '/utils/colors.dart';
import '/utils/const.dart';
import '/utils/styles.dart';
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

  final String pageIndicator = "assets/images/nav.png";

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.PADDING_INLINE),
        child: Stack(children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                onFirstPage = value == 0;
                onLastPage = value == 2;
              });
            },
            controller: _controller,
            itemBuilder: (context, index) {
              return Container(
                color: AppColors.PRIMARY_COLOR,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Spacing(height: 112),
                      SizedBox(
                          height: ScreenHeight * .34,
                          child: Image.asset(onbordingData[index].url)),
                      const Spacing(height: 36),
                      Image.asset(pageIndicator),
                      const Spacing(height: 50),
                      Text(
                        onbordingData[index].title,
                        style: mainHeadingStyle,
                      ),
                      const Spacing(height: 42),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          onbordingData[index].subTitle,
                          style: subHeadingStyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: onbordingData.length,
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
                        child: Text('BACK', style: textStyleLightColor)),
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
