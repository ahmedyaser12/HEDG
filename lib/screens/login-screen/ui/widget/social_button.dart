import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors.dart';

class SocialButton extends StatelessWidget {
  final String logoImage;

  const SocialButton({
    super.key,
    required this.logoImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.lightBlueColor.withOpacity(0.1)),
      child: SvgPicture.asset(logoImage),
    );
  }
}
