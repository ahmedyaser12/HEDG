import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/core/routing/routs_names.dart';
import 'package:hedg/screens/create_new_password_screen/Ui/create_new_password.dart';
import 'package:hedg/screens/login-screen/ui/login_screen.dart';

import '../../screens/forget_password_screen/Ui/forget_screen.dart';
import '../../screens/onboarding_screen/Ui/on_boarding_screen.dart';
import '../../screens/onboarding_screen/logic/onboarding_cubit.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.LOGIN: //home screen
        return MaterialPageRoute(
          builder: ((context) => const LoginScreen()),
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
