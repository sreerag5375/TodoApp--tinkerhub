import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/const.dart';

final ButtonStyle primaryBtnStyle = ElevatedButton.styleFrom(
  backgroundColor: AppColors.ASCENT_COLOR,
  foregroundColor: AppColors.SECONDARY_COLOR,
);

const TextStyle textStyle =
    TextStyle(fontSize: AppSizes.TEXT_SIZE, color: AppColors.SECONDARY_COLOR);
TextStyle textStyleLightColor =
    TextStyle(fontSize: AppSizes.TEXT_SIZE, color: AppColors.SECONDARY_HEADING);

TextStyle mainHeadingStyle = const TextStyle(
    fontSize: AppSizes.MAIN_HEADING_SIZE, color: AppColors.SECONDARY_COLOR);
TextStyle subHeadingStyle = TextStyle(
    fontSize: AppSizes.SUB_HEADING_SIZE, color: AppColors.SECONDARY_HEADING);
