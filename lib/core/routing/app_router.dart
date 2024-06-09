import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/core/routing/routs_names.dart';

import '../../screens/onboarding_screen/Ui/on_boarding_screen.dart';
import '../../screens/onboarding_screen/logic/onboarding_cubit.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.ONBOARDING:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                create: (_) => OnboardingCubit(),
                child: const OnboardingScreen())));
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
