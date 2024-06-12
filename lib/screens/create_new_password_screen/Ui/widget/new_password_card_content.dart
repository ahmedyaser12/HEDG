import 'package:flutter/material.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/common_functions.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/text_field.dart';

class NewPasswordCardContent extends StatelessWidget {
  const NewPasswordCardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FormTextFieldItem(
          hint: AppStrings.newPasswordHint,
          isPassword: true,
        ),
        heightSpace(15),
        const FormTextFieldItem(
          hint: AppStrings.rePasswordHint,
          isPassword: true,
        ),
        heightSpace(20),
        primaryButton(
          title: AppStrings.confirmButton,
          borderRadius: 12,
          verticalHeight: 13,
        ),
      ],
    );
  }
}