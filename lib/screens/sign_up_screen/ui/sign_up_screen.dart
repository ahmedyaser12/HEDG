import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hedg/core/utils/app_string.dart';
import 'package:hedg/core/utils/common_functions.dart';
import 'package:hedg/core/utils/extintions.dart';
import 'package:hedg/core/utils/styles.dart';
import 'package:hedg/screens/sign_up_screen/ui/widget/card_sign_up_content.dart';

import '../../../core/utils/colors.dart';
import '../../../core/widgets/build_card.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/login_background.png'),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: context.screenHeight,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svgs/app_logo.svg'),
                    heightSpace(25),
                    Text(
                      AppStrings.signupTitle,
                      style: TextStyles.font20BlackBold(context)
                          .copyWith(color: AppColors.whiteColor),
                    ),
                    const BuildCard(paddingVertical: 25,marginVertical: 40,
                      body: CardSignUpContent(),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
