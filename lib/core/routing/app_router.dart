import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/core/routing/routs_names.dart';
import 'package:hedg/screens/create_new_password_screen/Ui/create_new_password.dart';
import 'package:hedg/screens/login-screen/ui/login_screen.dart';
import 'package:hedg/screens/sign_up_screen/ui/sign_up_screen.dart';
import 'package:hedg/screens/verify_code_screen/Ui/verify_code_screen.dart';

import '../../screens/face_id_login_screen/Ui/face_id_screen.dart';
import '../../screens/forget_password_screen/Ui/forget_screen.dart';
import '../../screens/onboarding_screen/Ui/on_boarding_screen.dart';
import '../../screens/onboarding_screen/logic/onboarding_cubit.dart';
import '../../screens/take_id_card_screens/logic/id_card_cubit.dart';
import '../../screens/take_id_card_screens/ui/id_card_front_screen.dart';
import '../../screens/take_id_card_screens/ui/show_national_card_id.dart';
import '../services/services_locator.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.LOGIN: //home screen
        return MaterialPageRoute(
          builder: ((context) => const LoginScreen()),
        );
      case RouteName.SIGNUP: //home screen
        return MaterialPageRoute(
          builder: ((context) => const SignUpScreen()),
        );
      case RouteName.VERIFYCODE: //home screen
        return MaterialPageRoute(
          builder: ((context) => const VerifyCodeScreen()),
        );
      case RouteName.IDCARD: //home screen
        return MaterialPageRoute(
          builder: ((context) => BlocProvider.value(
                value: locator<IdCardCubit>(),
                child: const IdCardFrontScreen(),
              )),
        );
      case RouteName.NATIONALCARD: //home screen
        return MaterialPageRoute(
          builder: ((context) => BlocProvider.value(
                value: locator<IdCardCubit>(),
                child: const NationalCardId(),
              )),
        );
      case RouteName.ONBOARDING:
        return MaterialPageRoute(
          builder: ((context) => BlocProvider(
                create: (_) => OnboardingCubit(),
                child: const OnboardingScreen(),
              )),
        );

      case RouteName.FORGOT_PASSWORD:
        return MaterialPageRoute(
          builder: ((context) => const ForgotPasswordScreen()),
        );
      case RouteName.CREATENEWPASSWORD:
        return MaterialPageRoute(
          builder: ((context) => const CreateNewPassword()),
        );

      case RouteName.FACEID:
        return MaterialPageRoute(
          builder: ((context) => const FaceIdScreen()),
        );

      default:
        return null;
    }
  }

  static Route<dynamic> notFound() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text('Not Fount'),
            ),
          )),
    );
  }
}
