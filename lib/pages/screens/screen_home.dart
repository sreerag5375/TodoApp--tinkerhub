import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: AppColors.ASCENT_COLOR,
        title: const Text('home'),
      ),
      body: const Center(
        child: Text('home'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 50.0,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            onPressed: () {
              // Add your onPressed code here!
            },
            backgroundColor: AppColors.ASCENT_COLOR,
            child: const Text('Add Task'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
