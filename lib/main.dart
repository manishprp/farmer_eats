import 'package:flutter/material.dart';

import 'ui/view/onboarding/quality_screen.dart';
import 'ui/view/sign_in_screen/forgot_password_1.dart';
import 'ui/view/sign_in_screen/otp_enter_screen.dart';
import 'ui/view/sign_in_screen/reset_pass_screen.dart';
import 'ui/view/sign_in_screen/sign_in_main.dart';
import 'ui/view/signup_screen/signup_done_widget.dart';
import 'ui/view/signup_screen/signup_opt_widget3.dart';
import 'ui/view/signup_screen/signup_opt_widget4.dart';
import 'ui/view/signup_screen/signup_screen_step2.dart';

void main() {
  runApp(const FarmerEats());
}

class FarmerEats extends StatelessWidget {
  const FarmerEats({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          //textTheme:
          //    GoogleFonts.beVietnamProTextTheme(Theme.of(context).textTheme),
        ),
        home: const QualityScreen(),
      ),
    );
  }
}
