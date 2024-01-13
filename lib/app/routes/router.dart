import 'package:animations/animations.dart';
import 'package:cordova/app/pages/authentication/login_page.dart';
import 'package:cordova/app/pages/authentication/register_page.dart';
import 'package:cordova/app/pages/boarding/onboarding_page.dart';
import 'package:cordova/app/pages/home/home_page.dart';
import 'package:cordova/app/routes/route_name.dart';
import 'package:cordova/app/routes/route_path.dart';
import 'package:go_router/go_router.dart';

import '../pages/onboarding_form/form_page.dart';
import '../pages/onboarding_form/form_boarding_page.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: RoutePath.onboardingPage,
    name: RouteName.onboardingPage,
    builder: (context, state) => const OnboardingPage(),
  ),
  GoRoute(
    path: RoutePath.loginPage,
    name: RouteName.loginPage,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const LoginPage(),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: RoutePath.registerPage,
    name: RouteName.registerPage,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const RegisterPage(),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: RoutePath.homePage,
    name: RouteName.homePage,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const HomePage(),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: RoutePath.formBoardingPage,
    name: RouteName.formBoardingPage,
    builder: (context, state) => const FormBoardingPage(),
  ),
  GoRoute(
    path: RoutePath.formPage,
    name: RouteName.formPage,
    builder: (context, state) => const FormPage(),
  ),
]);
