import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import '../utils/common_functions.dart';

class VerifyTextField extends StatelessWidget {
  final bool isBorder;

  const VerifyTextField({super.key, required this.isBorder});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      verifyCodeWidget(context, isBorder),
      widthSpace(24),
      verifyCodeWidget(context, isBorder),
      widthSpace(24),
      verifyCodeWidget(context, isBorder),
      widthSpace(24),
      verifyCodeWidget(context, isBorder),
    ]);
  }
}

Widget verifyCodeWidget(BuildContext context, bool isBorder) {
  return SizedBox(
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
          enabledBorder: isBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: AppColors.grey50),
                )
              :  UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightBlueColor.withOpacity(.3),width: 1.5),
                ),
          border: isBorder
              ? const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                )
              : null,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ]),
  );
}
