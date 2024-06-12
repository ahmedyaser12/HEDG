import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/core/utils/colors.dart';
import 'package:hedg/core/utils/extintions.dart';

import '../../../../core/routing/routs_names.dart';
import '../../logic/onboarding_cubit.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primary,
        minimumSize: const Size(75, 75),
        fixedSize: const Size(75, 75),
      ),
      onPressed: () {
        context.read<OnboardingCubit>().pageIndex == 2
            ? context.navigateToAndReplacement(RouteName.LOGIN)
            : context.read<OnboardingCubit>().pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear);
      },
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        color: AppColors.whiteColor,
      ),
    );
  }
}
