import 'package:flutter/material.dart';

import '../utils/app_string.dart';
import '../utils/colors.dart';
import '../utils/common_functions.dart';
import '../utils/styles.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'assets/images/egypt_flag.png',
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
    );
  }
}
