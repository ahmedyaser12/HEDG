import 'package:flutter/material.dart';
import 'package:hedg/core/utils/styles.dart';
import 'package:hedg/screens/face_id_login_screen/Ui/widget/verify_widget.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/common_functions.dart';

class FaceIdScreen extends StatelessWidget {
  const FaceIdScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/face_id_logo.png',
              width: 150,
            ),
            heightSpace(30),
            Text(
              'Entre PIN code',
              style: TextStyles.font14greyW500
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            heightSpace(70),
            Image.asset('assets/images/faceID-vid.png',width: 150,),
            heightSpace(25),
            const VerifyTextField(),
          ],
        ),
      ),
    );
  }
}
