import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hedg/core/utils/extintions.dart';

import '../utils/colors.dart';
import '../utils/common_functions.dart';
import '../utils/styles.dart';

class FormTextFieldItem extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? title;
  final String? name;
  final String? hint;
  final TextInputType? keyboardType;
  final bool? enabled;
  final bool? isPassword;
  final int? lines;
  final Widget? suffixIcon;
  final Function(String)? validator;

  const FormTextFieldItem({
    super.key,
    this.controller,
    this.initialValue,
    this.title,
    this.name,
    this.hint,
    this.enabled,
    this.lines,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<FormTextFieldItem> createState() => _FormTextFieldItemState();
}

class _FormTextFieldItemState extends State<FormTextFieldItem> {
  final bool optional = false;
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: widget.name == null
              ? Container()
              : Text(
                  widget.name ?? '',
                  style: TextStyles.font15BlackW500(context),
                ),
        ),
        if (widget.title != null) heightSpace(8),
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkBlue
                : AppColors.whiteColor,
          ),
          width: double.infinity,
          child: Center(
            child: TextFormField(
              validator: (value) {
                return widget.validator!(value!);
              },
              initialValue: widget.initialValue,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              style: Theme.of(context).brightness == Brightness.dark
                  ? TextStyle(color: AppColors.whiteColor)
                  : TextStyle(color: AppColors.blackColor),
              //style: TextStyles.font14PrimarySemi,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey50,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.redColor,
                    width: 1.3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.redColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                //border: InputBorder.none,
                hintText: widget.hint ?? widget.title ?? "hint",
                hintStyle: TextStyles.font14greyW500,
                suffixIcon: widget.suffixIcon ??
                    (widget.isPassword == true
                        ? isSecure != true
                            ? Icon(Icons.visibility_outlined,
                                    color: AppColors.greyColor)
                                .onTap(() {
                                setState(() {
                                  isSecure = !isSecure;
                                });
                              })
                            : Icon(Icons.visibility_off_outlined,
                                    color: AppColors.greyColor)
                                .onTap(() {
                                setState(() {
                                  isSecure = !isSecure;
                                });
                              })
                        : null),
                counterText: '',
                //contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                isDense: true,
              ),
              maxLength: widget.lines,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              enabled: widget.enabled,
              obscureText: widget.isPassword == true ? isSecure : true,
            ),
          ),
        ),
      ],
    );
  }
}
