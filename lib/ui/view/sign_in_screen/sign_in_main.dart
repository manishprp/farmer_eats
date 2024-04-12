import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_spaces.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../../../constants/colors.dart';
import '../../../viewmodel/signup_bloc/signin/bloc/signin_bloc.dart';
import '../common/app_button_widget.dart';
import '../common/app_text_field.dart';
import '../common/custom_richtext_widget.dart';
import '../common/signup_options_widget.dart';

class SignInMain extends StatefulWidget {
  const SignInMain({super.key});

  @override
  State<SignInMain> createState() => _SignInMainState();
}

class _SignInMainState extends State<SignInMain> {
  final TextEditingController _emailAddressTextEditingController =
      TextEditingController(text: Appstrings.emptyString);

  final TextEditingController _passwordTextEditingController =
      TextEditingController(text: Appstrings.emptyString);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sharedObjectBloc = GetIt.I<SigninBloc>();
    return Scaffold(
      body: BlocConsumer<SigninBloc, SigninState>(
        bloc: sharedObjectBloc,
        listener: (context, state) {
          if (state is SigninFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Something went Wrong")));
          }
          if (state is SigninSuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged in Successfully")));
          }
        },
        builder: (context, state) {
          if (state is SigninSuccessful || state is SigninInitial) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      minWidth: constraints.maxWidth),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          Appstrings.farmerEats,
                          style: kTS16SpBlack,
                        ),
                        AppSizeConstants.heightConstants[110],
                        AppSizeConstants.heightConstants[10],
                        const Text(
                          Appstrings.welcomeBack,
                          style: kTS32SpBlackFont,
                        ),
                        AppSizeConstants.heightConstants[20],
                        CustomRichTextWidget(
                          nonClickableText: Appstrings.newHere,
                          clickableText: Appstrings.createAccount,
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.signUpPage1);
                          },
                        ),
                        AppSizeConstants.heightConstants[40],
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                AppTextFieldWidget(
                                    validator: (username) {
                                      if (username!.isEmpty) {
                                        return "Username cannot be empty";
                                      }
                                      return null;
                                    },
                                    inputype: TextInputType.name,
                                    controller:
                                        _emailAddressTextEditingController,
                                    prefixIcon: AppIcons.atIcon,
                                    label: Appstrings.emailAddress),
                                AppSizeConstants.heightConstants[20],
                                AppTextFieldWidget(
                                    validator: (password) {
                                      if (password!.isEmpty) {
                                        return "Password cannot be empty";
                                      }
                                      return null;
                                    },
                                    controller: _passwordTextEditingController,
                                    inputype: TextInputType.visiblePassword,
                                    prefixIcon: AppIcons.passwordIcon,
                                    suffixIon: Center(
                                      widthFactor: 1.5,
                                      child: Text(
                                        Appstrings.forgot,
                                        style: kTS14SpUnderLineBlack.copyWith(
                                            color: AppColors.buttonColor),
                                      ),
                                    ),
                                    label: Appstrings.password),
                              ],
                            )),
                        AppSizeConstants.heightConstants[25],
                        AppButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              sharedObjectBloc.login.email =
                                  _emailAddressTextEditingController.text;
                              sharedObjectBloc.login.password =
                                  _passwordTextEditingController.text;
                              sharedObjectBloc.login.deviceToken =
                                  Appstrings.deviceToken;
                              sharedObjectBloc.login.role = Appstrings.role;
                              sharedObjectBloc.login.type = Appstrings.type;
                              sharedObjectBloc.login.socialId =
                                  Appstrings.socialId;

                              sharedObjectBloc.add(OnSignIn());
                            }
                          },
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Text(
                              Appstrings.login,
                              style: kTS18White,
                            ),
                          ),
                        ),
                        AppSizeConstants.heightConstants[30],
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Appstrings.orloginWith,
                                style: kTS10SpLightBlackW400.copyWith(
                                    color:
                                        AppColors.blackFont.withOpacity(0.3)),
                              ),
                            ]),
                        AppSizeConstants.heightConstants[30],
                        const SignupOptionsWidget(),
                      ],
                    ),
                  ),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
