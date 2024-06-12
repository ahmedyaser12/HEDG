import 'package:flutter/material.dart';
import 'package:hedg/core/routing/routs_names.dart';
import 'package:hedg/core/utils/extintions.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/common_functions.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/phone_number_text_field.dart';

class ForgetCardContent extends StatelessWidget {
  const ForgetCardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PhoneNumberTextField(),
        heightSpace(20),
        primaryButton(
          title: AppStrings.forgetPasswordSend,
          borderRadius: 12,
          verticalHeight: 13,
        ).onTap(() {
          context.navigateTo(RouteName.CREATENEWPASSWORD);
        }),
      ],
    );
  }
}
