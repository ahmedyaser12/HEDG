import 'package:flutter/material.dart';
import 'package:hedg/core/routing/routs_names.dart';
import 'package:hedg/core/utils/extintions.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/common_functions.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/verify_widget.dart';

class VerifyCodeCardContent extends StatelessWidget {
  const VerifyCodeCardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerifyTextField(isBorder:  false,),
        heightSpace(20),
        primaryButton(
          title: AppStrings.verificationContinueButton,
          borderRadius: 12,
          verticalHeight: 13,
        ).onTap(() {
          context.navigateTo(RouteName.CREATENEWPASSWORD);
        }),
      ],
    );
  }
}
