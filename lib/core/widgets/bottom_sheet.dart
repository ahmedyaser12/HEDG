import 'package:flutter/material.dart';

import '../utils/colors.dart';

Future bottomSheet(
  BuildContext context, {double? maxHeight,
  required Widget buildBody,
}) {
  return showModalBottomSheet(
  
    isScrollControlled: true,
    context: context,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.4,
      // 40% of screen height
      minChildSize: 0.2,
      // 20% of screen height
      maxChildSize: maxHeight ?? 0.6,
      expand: false,
      //Full screen
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness ==
                                          Brightness.dark
                                          ?AppColors.darkBlue
                                          : AppColors.whiteColor,
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                buildBody,
              ],
            ),
          ),
        );
      },
    ),
  );
}
