import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hedg/core/utils/extintions.dart';
import 'package:hedg/core/widgets/social_button.dart';

import '../../../../core/routing/routs_names.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/common_functions.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/text_field.dart';

class CardLoginContent extends StatelessWidget {
  CardLoginContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const FormTextFieldItem(hint: AppStrings.loginEmailHint),
      heightSpace(20),
      const FormTextFieldItem(
        hint: AppStrings.loginPasswordHint,
        isPassword: true,
      ),
      heightSpace(20),
      Text(
        AppStrings.loginForgotPassword,
        style: TextStyles.font12Primary500weight,
      ).onTap(() {
        context.navigateTo(RouteName.FORGOT_PASSWORD);
      }),
      heightSpace(20),
      primaryButton(
        title: AppStrings.loginButton,
        borderRadius: 12,
        verticalHeight: 15,
      ),
      heightSpace(20),
      Text(
        AppStrings.loginOr,
        style: TextStyles.font12Primary500weight,
      ),
      heightSpace(20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SocialButton(logoImage: 'assets/svgs/google_icon.svg'),
          widthSpace(20),
          const SocialButton(logoImage: 'assets/svgs/apple-logo.svg'),
        ],
      ),
      heightSpace(20),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: AppStrings.loginDontHaveAccount,
                style: TextStyles.font14Primary500weight),
            TextSpan(
                text: AppStrings.loginSignUp,
                style: TextStyles.font14Primary500weight.copyWith(
                    color: AppColors.secondary, fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.navigateTo(RouteName.SIGNUP);
                  })
          ],
        ),
      ),
    ]);
  }
}
