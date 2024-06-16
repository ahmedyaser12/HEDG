import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/core/utils/app_string.dart';
import 'package:hedg/core/utils/extintions.dart';
import 'package:hedg/core/widgets/app_buttons.dart';
import 'package:hedg/core/widgets/build_card.dart';
import 'package:hedg/core/widgets/custom_appBar.dart';
import 'package:hedg/screens/take_id_card_screens/logic/id_card_cubit.dart';
import 'package:hedg/screens/take_id_card_screens/ui/widget/id_front_card_content.dart';
import 'package:hedg/screens/take_id_card_screens/ui/widget/stepper_widget.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/common_functions.dart';
import '../../../core/utils/styles.dart';

class IdCardFrontScreen extends StatefulWidget {
  const IdCardFrontScreen({super.key});

  @override
  IdCardFrontScreenState createState() => IdCardFrontScreenState();
}

class IdCardFrontScreenState extends State<IdCardFrontScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey3,
      appBar: customAppBarr(
        centerWidget: Image.asset(
          'assets/images/logo_app_grey.png',
          width: 150,
        ),
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StepperWidget(),
            Text(
              AppStrings.idAddNationalIdFront,
              style: TextStyles.font14SecondaryW700
                  .copyWith(color: AppColors.primary),
            ),
            heightSpace(15),
            BuildCard(
              marginVertical: 10,
              paddingVertical: 20,
              shadowColor: AppColors.grey,
              body: const IdFrontCardContent(),
            ),
            heightSpace(20),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: AppStrings.idWhatsappHelp.substring(0, 66),
                  style: TextStyles.font13grey500weight
                      .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: AppStrings.idWhatsappHelp.substring(66, 75),
                      style: TextStyles.font13grey500weight.copyWith(
                          color: AppColors.blackColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
            heightSpace(50),
            BlocBuilder<IdCardCubit, IdCardState>(
              builder: (context, state) {
                return primaryButton(
                  title: AppStrings.idSave,
                  borderRadius: 12,
                  verticalHeight: 15,
                  color: AppColors.primary.withOpacity(
                    context.read<IdCardCubit>().activeStep == 0
                        ? context.read<IdCardCubit>().frontImage != null
                            ? 1
                            : 0.5
                        : context.read<IdCardCubit>().backImage != null
                            ? 1
                            : 0.5,
                  ),
                ).onTap(borderRadius: BorderRadius.circular(12), () {
                  context.read<IdCardCubit>().frontImage != null
                      ? context.read<IdCardCubit>().nextStep()
                      : null;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
