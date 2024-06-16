import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
            BlocBuilder<IdCardCubit, IdCardState>(
              buildWhen: (previous, state) => state is IdCardImage,
              builder: (context, state) {
                final cubit = context.read<IdCardCubit>();
                final isFirstStep = cubit.activeStep == 0;
                Widget buildImage(String? path) {
                  return GestureDetector(
                    onTap: () async {
                      final pickedImage = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedImage != null) {
                        isFirstStep
                            ? cubit.uploadFrontImage(pickedImage)
                            : cubit.uploadBackImage(pickedImage);
                      }
                    },
                    child: path != null
                        ? Image.file(
                            File(path),
                            height: 150,
                            width: double.infinity,
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'assets/images/camera-logo.png',
                            height: 150,
                            width: double.infinity,
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                          ),
                  );
                }

                if (state is IdCardImage) {
                  return isFirstStep
                      ? buildImage(cubit.frontImage?.path)
                      : buildImage(cubit.backImage?.path);
                } else {
                  return buildImage(null);
                }
              },
            ),
            heightSpace(60),
          ],
        );
      },
    );
  }
}
