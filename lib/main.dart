import 'package:farmer_eats/routes/routes.dart';
import 'package:farmer_eats/services/file_picker.dart';
import 'package:farmer_eats/viewmodel/signup_bloc/bloc/signup_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  GetIt.I.registerSingleton<FilePickerClass>(FilePickerClass());
}

class FarmerEats extends StatelessWidget {
  const FarmerEats({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignupBlocBloc>(
            create: (context) {
              return SignupBlocBloc();
            },
          )
        ],
        child: MaterialApp(
          routes: Routes.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.blue,
          ),
          home: const PageViewScreen(),
        ),
      ),
    );
  }
}
