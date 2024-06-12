import 'package:flutter/material.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/common_functions.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/app_buttons.dart';

class CardContent extends StatelessWidget {
  const CardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.gery50,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/account - 2-image.png',
                    // Make sure you have this asset in your project
                    width: 24,
                    height: 24,
                  ),
                  widthSpace(5),
                  Text(
                    '+20',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.gery50,
                    ),
                  ),
                ],
              ),
              // Add the vertical line
              Container(
                width: 1,
                height: 50,
                color: AppColors.gery50,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppStrings.forgetPasswordHint,
                    hintStyle: TextStyles.font14greyW500,
                  ),
                ),
              ),
            ],
          ),
        ),
        heightSpace(20),
        primaryButton(
          title: AppStrings.forgetPasswordSend,
          borderRadius: 12,
          verticalHeight: 13,
        ),
      ],
    );
  }
}
