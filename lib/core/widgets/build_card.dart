import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BuildCard extends StatelessWidget {
  final Widget body;
  final Color? shadowColor;
  final double marginVertical;
  final double paddingVertical;

  const BuildCard({
    this.shadowColor,
    super.key,
    required this.body,
    this.marginVertical = 50,
    this.paddingVertical = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: marginVertical),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: paddingVertical),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? AppColors.lightBlueColor.withOpacity(0.06666),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: body,
    );
  }
}
