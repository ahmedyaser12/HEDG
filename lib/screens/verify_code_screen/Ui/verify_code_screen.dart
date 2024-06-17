import 'package:flutter/material.dart';
import 'package:hedg/core/utils/app_string.dart';
import 'package:hedg/core/utils/colors.dart';
import 'package:hedg/core/utils/common_functions.dart';
import 'package:hedg/core/utils/extintions.dart';
import 'package:hedg/core/utils/styles.dart';
import 'package:hedg/core/widgets/build_card.dart';
import 'package:hedg/core/widgets/custom_appBar.dart';
import 'package:hedg/screens/forget_password_screen/Ui/widget/forget_card_content.dart';
import 'package:hedg/screens/verify_code_screen/Ui/widget/verify_code_card_content.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarr(
        context: context,
        leading: Icon(
          Icons.arrow_back_ios,
          color: AppColors.blackColor,
        ).onTap(() => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            heightSpace(40),
            Image.asset(
              'assets/images/verification.png', // Add your image asset here
              height: 140,
            ),
            heightSpace(20),
            Text(
              AppStrings.verificationTitle,
              style: TextStyles.font20BlackBold(context).copyWith(
                color: AppColors.secondary,
              ),
            ),
            heightSpace(10),
            Text(
              AppStrings.verificationDescription,
              textAlign: TextAlign.center,
              style: TextStyles.font14greyW500,
            ),
            const BuildCard(
              marginVertical: 25,
              paddingVertical: 40,
              body: VerifyCodeCardContent(),
            ),
            Text(
              AppStrings.verificationResendCode,
              style: TextStyles.font14SecondaryW700,
            ),
          ],
        ),
      ),
    );
  }
}
