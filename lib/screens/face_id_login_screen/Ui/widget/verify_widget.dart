import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/common_functions.dart';

class VerifyTextField extends StatelessWidget {
  const VerifyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      verifyCodeWidget(context),
      widthSpace(24),
      verifyCodeWidget(context),
      widthSpace(24),
      verifyCodeWidget(context),
      widthSpace(24),
      verifyCodeWidget(context),
    ]);
  }
}

Widget verifyCodeWidget(BuildContext context) {
  return Container(
    width: 40,
    height: 55,
    child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.gery50),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ]),
  );
}
