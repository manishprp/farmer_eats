import 'package:farmer_eats/ui/view/onboarding/page_view_screen.dart';
import 'package:farmer_eats/ui/view/sign_in_screen/forgot_password_1.dart';
import 'package:farmer_eats/ui/view/sign_in_screen/otp_enter_screen.dart';
import 'package:farmer_eats/ui/view/sign_in_screen/reset_pass_screen.dart';
import 'package:farmer_eats/ui/view/sign_in_screen/sign_in_main.dart';
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

  static const String signInMain = "/signInMain";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";
  static const String verifyOtpScreen = "/verifyOtpScreen";
  static const String resetPasswordScreen = "/resetPasswordScreen";

  static final routes = <String, WidgetBuilder>{
    onBoardingPage: (BuildContext context) => const PageViewScreen(),
    signUpPage1: (context) => const SignUpScreenWidget(),
    signUpPage2: (context) => SignUpScreenStep2Widget(),
    signUpPage3: (context) => const SignUpScreenStep3Widget(),
    signUpPage4: (context) => const SignUpScreenStep4Widget(),
    signupDone: (context) => const SignupDoneWidget(),
    signInMain: (context) => SignInMain(),
    forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
    verifyOtpScreen: (context) => const OtpEnterScreen(),
    resetPasswordScreen: (context) => const ResetPassScreen(),
  };
}
