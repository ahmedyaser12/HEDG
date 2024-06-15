import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget primaryButton({
  required String title,
  Color? color,
  required double borderRadius,
  double verticalHeight = 20,
}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: verticalHeight),
    decoration: BoxDecoration(
      color: color ?? AppColors.primary,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: FittedBox(
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget secondaryButton(BuildContext context, String title, {String? image}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.lightBlue
          : AppColors.secondary,
      borderRadius: BorderRadius.circular(30),
    ),
    child: FittedBox(
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
