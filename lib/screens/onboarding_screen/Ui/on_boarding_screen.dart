import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hedg/core/utils/extintions.dart';
import 'package:hedg/core/widgets/custom_appBar.dart';
import 'package:hedg/screens/onboarding_screen/Ui/widget/onboarding_button.dart';

import '../../../core/routing/routs_names.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/common_functions.dart';
import '../../../core/utils/styles.dart';
import '../logic/onboarding_cubit.dart';
import 'widget/dots_indicator_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBarr(
              action: [
                context.read<OnboardingCubit>().pageIndex != 2
                    ? TextButton(
                        onPressed: () {
                          context.navigateToAndReplacement(RouteName.LOGIN);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyles.font20BlackBold(context)
                              .copyWith(color: AppColors.secondary),
                        ),
                      )
                    : Container(),
              ],
              context: context,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: SizedBox(
                    height: context.screenHeight / 1.8,
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller:
                          context.read<OnboardingCubit>().pageController,
                      onPageChanged: (index) {
                        context.read<OnboardingCubit>().currentIndex(index);
                      },
                      itemCount:
                          context.read<OnboardingCubit>().onboardingData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: context
                                              .read<OnboardingCubit>()
                                              .pageIndex ==
                                          0
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      context
                                          .read<OnboardingCubit>()
                                          .onboardingData[index]
                                          .image
                                          .toString(),
                                      fit: context
                                                  .read<OnboardingCubit>()
                                                  .pageIndex ==
                                              1
                                          ? BoxFit.fill
                                          : null,
                                      width: context
                                                  .read<OnboardingCubit>()
                                                  .pageIndex ==
                                              1
                                          ? 375.w
                                          : null,
                                      height: 320.h,
                                    ),
                                  ],
                                ),
                                heightSpace(70),
                                Text(
                                  context
                                      .read<OnboardingCubit>()
                                      .onboardingData[index]
                                      .title
                                      .toString(),
                                  style: TextStyles.font20BlackBold(context)
                                      .copyWith(color: AppColors.secondary),
                                  textAlign: TextAlign.center,
                                ),
                                heightSpace(12),
                                Text(
                                  context
                                      .read<OnboardingCubit>()
                                      .onboardingData[index]
                                      .subTitle
                                      .toString(),
                                  style: TextStyles.font14greyW500(context),
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                        );
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    DotsIndicatorWidget(
                      currentIndex: context.read<OnboardingCubit>().pageIndex,
                    ),
                    heightSpace(70.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          context.read<OnboardingCubit>().pageIndex != 0
                              ? TextButton(
                                  onPressed: () {
                                    context
                                        .read<OnboardingCubit>()
                                        .pageController
                                        .previousPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.linear);
                                  },
                                  child: Text('Back',
                                      style: TextStyles.font16PrimaryMedium),
                                )
                              : Container(),
                          const OnboardingButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
