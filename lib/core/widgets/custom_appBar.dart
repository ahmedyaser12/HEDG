import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final String title;
  final IconThemeData? iconThemeData;
  final Color? color;
  final List<Widget>? action;

  const CustomAppBar(
      {super.key,
      this.leading,
      required this.title,
      this.iconThemeData,
      this.color,
      this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: leading,
      iconTheme: iconThemeData,
      title: Text(
        title,
        style: TextStyles.font20BlackBold(context),
      ),
      backgroundColor: color,
      actions: action,
    );
  }
}

customAppBarr({
  required context,
  final Widget? centerWidget,
  final Widget? leading,
  final String? title,
  final IconThemeData? iconThemeData,
  final Color? color,
  final List<Widget>? action,
}) {
  return AppBar(
    centerTitle: true,
    leading: leading,
    iconTheme: iconThemeData,
    title: title == null
        ? centerWidget
        : Text(
            title ?? '',
            style: TextStyles.font20BlackBold(context),
          ),
    backgroundColor: color,
    actions: action,
  );
}
