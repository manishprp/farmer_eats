import 'package:farmer_eats/ui/view/onboarding/page_view_screen.dart';
import 'package:flutter/material.dart';

import '../ui/view/signup_screen/sign_up_screen.dart';
import '../ui/view/signup_screen/signup_done_widget.dart';
import '../ui/view/signup_screen/signup_opt_widget3.dart';
import '../ui/view/signup_screen/signup_opt_widget4.dart';
import '../ui/view/signup_screen/signup_screen_step2.dart';

class AppRoutes {
  AppRoutes._();
  static const String onBoardingPage = '/onBoardingPage';
  static const String signUpPage1 = "/signUpPage1";
  static const String signUpPage2 = "/signUpPage2";
  static const String signUpPage3 = "/signUpPage3";
  static const String signUpPage4 = "/signUpPage4";
  static const String signupDone = "/signupDone";

  static final routes = <String, WidgetBuilder>{
    onBoardingPage: (BuildContext context) => const PageViewScreen(),
    signUpPage1: (context) => const SignUpScreenWidget(),
    signUpPage2: (context) => SignUpScreenStep2Widget(),
    signUpPage3: (context) => SignUpScreenStep3Widget(),
    signUpPage4: (context) => const SignUpScreenStep4Widget(),
    signupDone: (context) => const SignupDoneWidget()
  };
}
