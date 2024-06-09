import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hedg/core/utils/extintions.dart';
import 'package:hedg/core/widgets/custom_appBar.dart';

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
      child: Scaffold(
        appBar: customAppBarr(
          action: [
            TextButton(
                onPressed: () {
                  context.navigateToAndReplacement(RouteName.LOGIN);
                },
                child: Text('Skip',
                    style: TextStyles.font18BlackBold(context)
                        .copyWith(color: AppColors.secondary)))
          ],
          context: context,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 28.0, left: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: SizedBox(
                  height: context.screenHeight / 2.1,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: context.read<OnboardingCubit>().pageController,
                    onPageChanged: (index) {
                      context.read<OnboardingCubit>().currentIndex(index);
                    },
                    itemCount:
                        context.read<OnboardingCubit>().onboardingData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                context
                                    .read<OnboardingCubit>()
                                    .onboardingData[index]
                                    .image
                                    .toString(),
                                fit: BoxFit.fill,
                                height: 219.h,
                              ),
                              heightSpace(70),
                              Text(
                                context
                                    .read<OnboardingCubit>()
                                    .onboardingData[index]
                                    .title
                                    .toString(),
                                style: TextStyles.font18BlackBold(context).copyWith(fontSize: 20,color: AppColors.secondary),
                                textAlign: TextAlign.center,
                              ),
                              heightSpace(12),
                              Text(
                                context
                                    .read<OnboardingCubit>()
                                    .onboardingData[index]
                                    .subTitle
                                    .toString(),
                                style: TextStyles.font16grey(context),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, onboardingState) {
                  return Column(
                    children: [
                      DotsIndicatorWidget(
                        currentIndex: context.read<OnboardingCubit>().pageIndex,
                      ),
                      heightSpace(70.h),
                      Row(
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
                          TextButton(
                            style: TextButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.primary,
                              minimumSize: const Size(75, 75),
                              fixedSize: const Size(75, 75),
                            ),
                            onPressed: () {
                              context.read<OnboardingCubit>().pageIndex == 2
                                  ? context
                                      .navigateToAndReplacement(RouteName.LOGIN)
                                  : context
                                      .read<OnboardingCubit>()
                                      .pageController
                                      .nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.linear);
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColors.whiteColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
