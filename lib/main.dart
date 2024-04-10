import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'model/repositories/forgotpassrepo/i_forgot_password_repo.dart';
import 'model/repositories/signinuserrepo/i_sign_in_user_repo.dart';
import 'model/repositories/signinuserrepo/sign_in_user_repo.dart';
import 'model/repositories/signupuserrepo/i_signup_user_repo.dart';
import 'model/repositories/signupuserrepo/signup_user_repo.dart';
import 'services/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'model/repositories/forgotpassrepo/forgot_password_repo.dart';
import 'ui/view/onboarding/page_view_screen.dart';

void main() {
  setupLocator();
  runApp(const FarmerEats());
}

void setupLocator() {
  GetIt.I.registerSingleton<Client>(Client());
  GetIt.I.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  //final myService = GetIt.I<MyService>();
  GetIt.I.registerFactory<IForgotPasswordRepository>(
      () => ForgotPasswordRepository());
  GetIt.I.registerFactory<ISignInUserRepository>(() => SignInUserRepository());
  GetIt.I.registerFactory<ISignupUserRepository>(() => SignupUserRepository());
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
        ),
        home: const PageViewScreen(),
      ),
    );
  }
}
