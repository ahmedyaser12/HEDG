import 'package:flutter/material.dart';

import 'colors.dart';

class TextStyles {
  static TextStyle font20BlackBold(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.blackColor
          : AppColors.whiteColor,
    );
  }

  static TextStyle font14greyW500 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.greyColor,
  );
  static TextStyle font14SecondaryW700 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.secondary,
  );
  static TextStyle font12Primary500weight = TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static TextStyle font14Primary500weight = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static TextStyle font13grey500weight =  TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.grey2,
  );

  static TextStyle font15BlackW500(BuildContext context) {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.blackColor
          : AppColors.whiteColor,
    );
  }

  static TextStyle font14BlackSemi(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.blackColor
          : AppColors.whiteColor,
    );
  }

  static TextStyle font16PrimaryW800 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.primary,
  );

  static TextStyle font14RedBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.redColor,
  );
}
