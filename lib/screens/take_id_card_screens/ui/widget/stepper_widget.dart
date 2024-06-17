import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/screens/take_id_card_screens/logic/id_card_cubit.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({
    super.key,
  });

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IdCardCubit, IdCardState>(
      builder: (context, state) {
        return EasyStepper(
          activeStep: context.read<IdCardCubit>().activeStep,
          lineStyle: LineStyle(
            lineLength: 30,
            lineSpace: 0,
            lineType: LineType.normal,
            defaultLineColor: AppColors.grey,
            lineThickness: 3,
          ),
          activeStepTextColor: AppColors.secondary,
          stepRadius: 15,
          internalPadding: 0,
          showLoadingAnimation: false,
          showStepBorder: false,
          padding: EdgeInsets.zero,
          steps: [
            for (int i = 0; i < 6; i++)
              EasyStep(
                enabled: i <= context.read<IdCardCubit>().activeStep + 1,
                customStep: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i <= context.read<IdCardCubit>().activeStep
                        ? AppColors.secondary
                        : AppColors.whiteColor,
                    border: i <= context.read<IdCardCubit>().activeStep
                        ? null
                        : Border.all(
                            color: AppColors.grey,
                            width: 2,
                          ),
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        "${i + 1}",
                        style: TextStyles.font15BlackW500(context).copyWith(
                          color: i <= context.read<IdCardCubit>().activeStep
                              ? AppColors.whiteColor
                              : AppColors.grey2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                title: context.read<IdCardCubit>().steps[i],
                customTitle: Text(
                  context.read<IdCardCubit>().steps[i],
                  style: TextStyles.font14Primary500weight.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: i <= context.read<IdCardCubit>().activeStep
                          ? AppColors.secondary
                          : AppColors.grey2),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
          onStepReached: (index) =>
              context.read<IdCardCubit>().saveActiveStep(index),
        );
      },
    );
  }
}
