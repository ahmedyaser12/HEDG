import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/core/utils/app_string.dart';

import '../data/model/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  int pageIndex = 0;
  PageController pageController = PageController();
  List<OnboardingModel> onboardingData = [
    OnboardingModel(
      'assets/images/onboarding1.png',
      AppStrings.onboardingTitle1,
      AppStrings.onboardingSubTitle1,
    ),
    OnboardingModel(
      'assets/images/onboarding2.png',
      AppStrings.onboardingTitle2,
      AppStrings.onboardingSubTitle2,
    ),
    OnboardingModel(
      'assets/images/onboarding3.png',
      AppStrings.onboardingTitle2,
      AppStrings.onboardingSubTitle2,
    )
  ];

  void currentIndex(int index) {
    emit(OnboardingInitial());
    pageIndex = index;
    emit(OnboardingNext());
  }
}
