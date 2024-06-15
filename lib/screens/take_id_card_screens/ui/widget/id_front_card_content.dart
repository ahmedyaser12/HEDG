import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/common_functions.dart';
import '../../../../core/utils/styles.dart';
import '../../logic/id_card_cubit.dart';

class IdFrontCardContent extends StatelessWidget {
  const IdFrontCardContent({
    super.key,
  });

  String idCardTitle(int step) {
    if (step == 0) {
      return AppStrings.idCardFront;
    } else {
      return AppStrings.idCardBack;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IdCardCubit, IdCardState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              idCardTitle(context.read<IdCardCubit>().activeStep),
              style: TextStyles.font15BlackW500(context).copyWith(fontSize: 18),
            ),
            heightSpace(10),
            Text(
              AppStrings.idPhotoInstruction,
              style: TextStyles.font13grey500weight.copyWith(fontSize: 11),
            ),
            heightSpace(60),
            Image.asset(
              'assets/images/camera-logo.png',
            ),
            heightSpace(60),
          ],
        );
      },
    );
  }
}
