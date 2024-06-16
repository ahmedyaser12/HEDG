import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/common_functions.dart';
import '../../../core/utils/styles.dart';
import '../../../core/widgets/build_card.dart';
import '../logic/id_card_cubit.dart';

class NationalCardId extends StatelessWidget {
  const NationalCardId({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BuildCard(
        marginVertical: 10,
        paddingVertical: 20,
        shadowColor: AppColors.grey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.addNationalId,
              style: TextStyles.font14SecondaryW700
                  .copyWith(color: AppColors.primary),
            ),
            heightSpace(15),
            Stack(children: [
              Image.file(
                File(context.read<IdCardCubit>().frontImage!.path),
                height: 150,
                width: double.infinity,
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: removeButton(),
              ),
            ]),
            heightSpace(15),
            Stack(children: [
              Image.file(
                File(context.read<IdCardCubit>().backImage!.path),
                height: 150,
                width: double.infinity,
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: removeButton(),
              ),
            ])
          ],
        ),
      ),
    );
  }

  Container removeButton() {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Icon(
        Icons.delete,
        color: AppColors.redColor,
      ),
    );
  }
}
