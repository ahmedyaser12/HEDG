import 'package:flutter/material.dart';
import 'package:hedg/core/utils/app_string.dart';
import 'package:hedg/core/widgets/build_card.dart';
import 'package:hedg/core/widgets/custom_appBar.dart';
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
  int activeStep = 0;

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
            heightSpace(30),
            // Text(
            //   AppStrings.addNationalIdFront,
            //   style: TextStyles.font14SecondaryW700
            //       .copyWith(color: AppColors.primary),
            // ),
            // heightSpace(15),
            // const BuildCard(body: Column(
            //   children: [
            //     Text(''),
            //   ],
            // ))
          ],
        ),
      ),
    );
  }
}
