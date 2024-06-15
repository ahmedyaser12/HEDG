import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/app_string.dart';

part 'id_card_state.dart';

class IdCardCubit extends Cubit<IdCardState> {
  IdCardCubit() : super(IdCardInitial());
  int activeStep = 1;

  void saveActiveStep(int index) {
    activeStep = index;
    print(activeStep);
    emit(ActiveIndex());
  }

  List<String> steps = [
    AppStrings.step1,
    AppStrings.step2,
    AppStrings.step3,
    AppStrings.step4,
    AppStrings.step5,
    AppStrings.step6
  ];


  // void nextStep() {
  //   if (activeStep < steps.length - 1) {
  //     activeStep++;
  //     emit(ActiveIndex());
  //   }
  // }
}
