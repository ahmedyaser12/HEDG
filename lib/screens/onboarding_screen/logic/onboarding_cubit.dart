import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  int pageIndex = 0;
  PageController pageController = PageController();
  List<OnboardingModel> onboardingData = [
    OnboardingModel(
      'assets/images/onboarding1.png',
      'assets/images/background1.png',
      'Shape Your Financial Future ',
      ' invest your money By Starting With\nHEDG, and secure financial freedom',
    ),
    OnboardingModel(
      'assets/images/onboarding2.png',
      'assets/images/background2.png',
      'Track Your Investments',
      'see your return on investments in the\nselected plans',
    ),
    OnboardingModel(
      'assets/images/onboarding3.png',
      'assets/images/background3.png',
      'Calculate Before Investing',
      'calculate your potential growth to\nchoose the perfect option for you',
    )
  ];

  void currentIndex(int index) {
    emit(OnboardingInitial());
    pageIndex = index;
    print(pageIndex);
    emit(OnboardingNext());
  }
}
