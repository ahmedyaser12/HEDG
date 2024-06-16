import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/app_string.dart';

part 'id_card_state.dart';

class IdCardCubit extends Cubit<IdCardState> {
  IdCardCubit() : super(IdCardInitial());
  int activeStep = 0;
  XFile? frontImage;
  XFile? backImage;

  void saveActiveStep(int index) {
    if (activeStep <= index) {
      return;
    }
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

  uploadFrontImage(XFile uploadImage) {
    frontImage = uploadImage;
    print(frontImage!.path);
    emit(IdCardImage(frontImage!));
  }

  uploadBackImage(XFile uploadImage) {
    backImage = uploadImage;
    print(backImage!.path);
    emit(IdCardImage(backImage!));
  }

  void nextStep() {
    if (activeStep < steps.length - 1) {
      activeStep++;
      emit(ActiveIndex());
    }
  }
}
