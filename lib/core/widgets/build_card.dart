import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BuildCard extends StatelessWidget {
  final Widget body;

  const BuildCard({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: AppColors.lightBlueColor.withOpacity(0.2),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: body,
      ),
    );
  }
}