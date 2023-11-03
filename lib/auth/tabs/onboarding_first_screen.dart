import 'package:flutter/material.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:const  Center(child: Text("screen 1",style: TextStyle(fontSize: 26,color: Colors.white),),),
    );
  }
}