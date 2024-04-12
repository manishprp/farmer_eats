import 'package:get_it/get_it.dart';

import '../../../routes/app_routes.dart';
import '../../../viewmodel/signup_bloc/bloc/signup_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_spaces.dart';
import '../../../constants/app_textstyles.dart';
import '../common/app_button_widget.dart';
import '../common/app_text_field.dart';
import '../common/signup_options_widget.dart';

class SignUpScreenWidget extends StatefulWidget {
  const SignUpScreenWidget({super.key});

  @override
  State<SignUpScreenWidget> createState() => _SignUpScreenWidgetState();
}

class _SignUpScreenWidgetState extends State<SignUpScreenWidget> {
  final TextEditingController _fullnameTextEditingController =
      TextEditingController(text: Appstrings.emptyString);

  final TextEditingController _emailAddressTextEditingController =
      TextEditingController(text: Appstrings.emptyString);

  final TextEditingController _phoneNumberTextEditingController =
      TextEditingController(text: Appstrings.emptyString);

  final TextEditingController _passwordTextEditingController =
      TextEditingController(text: Appstrings.emptyString);

  final TextEditingController _reEnterPasswordTextEditingController =
      TextEditingController(text: Appstrings.emptyString);
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _fullnameTextEditingController.dispose();
    _emailAddressTextEditingController.dispose();
    _phoneNumberTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _reEnterPasswordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sharedObjectBloc = GetIt.I<SignupBlocBloc>();

    return Scaffold(
      body: Padding(
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
                  AppSizeConstants.heightConstants[40],
                  Text(
                    Appstrings.signup1To4,
                    style: kTS14SpLightBlack.copyWith(
                        color: AppColors.black.withOpacity(0.3)),
                  ),
                  AppSizeConstants.heightConstants[10],
                  const Text(
                    Appstrings.welcome,
                    style: kTS32SpBlackFont,
                  ),
                  AppSizeConstants.heightConstants[40],
                  const SignupOptionsWidget(),
                  AppSizeConstants.heightConstants[29],
                  Center(
                    child: Text(
                      Appstrings.orSignupWith,
                      style: kTS10SpLightBlack.copyWith(
                          color: AppColors.black.withOpacity(0.3)),
                    ),
                  ),
                  AppSizeConstants.heightConstants[29],
                  // form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AppTextFieldWidget(
                          inputype: TextInputType.text,
                          controller: _fullnameTextEditingController,
                          label: Appstrings.fullName,
                          prefixIcon: AppIcons.userIcon,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Appstrings.fullnameCannotBeEmpty;
                            }
                            return null;
                          },
                        ),
                        AppSizeConstants.heightConstants[20],
                        AppTextFieldWidget(
                          inputype: TextInputType.emailAddress,
                          controller: _emailAddressTextEditingController,
                          label: Appstrings.emailAddress,
                          prefixIcon: AppIcons.atIcon,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Appstrings.emailaddressCannotBeEmpty;
                            }
                            return null;
                          },
                        ),
                        AppSizeConstants.heightConstants[20],
                        AppTextFieldWidget(
                          inputype: TextInputType.phone,
                          controller: _phoneNumberTextEditingController,
                          label: Appstrings.phoneNumber,
                          prefixIcon: AppIcons.callIcon,
                          validator: (value) {
                            if (value!.length != 10) {
                              return Appstrings.invalidPhoneNumber;
                            }
                            return null;
                          },
                        ),
                        AppSizeConstants.heightConstants[20],
                        AppTextFieldWidget(
                          inputype: TextInputType.visiblePassword,
                          controller: _passwordTextEditingController,
                          label: Appstrings.password,
                          prefixIcon: AppIcons.passwordIcon,
                          validator: (value) {
                            if (value!.length < 6) {
                              return Appstrings
                                  .passwordShouldBeAtleast6CharactersLong;
                            }
                            return null;
                          },
                        ),
                        AppSizeConstants.heightConstants[20],
                        AppTextFieldWidget(
                          inputype: TextInputType.visiblePassword,
                          controller: _reEnterPasswordTextEditingController,
                          label: Appstrings.reEnterPassword,
                          prefixIcon: AppIcons.passwordIcon,
                          validator: (value) {
                            if (value!.length < 6) {
                              return Appstrings
                                  .passwordShouldBeAtleast6CharactersLong;
                            }
                            if (value != _passwordTextEditingController.text) {
                              return Appstrings
                                  .passwordAndConfirmPasswordShouldBeSimilar;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),

                  AppSizeConstants.heightConstants[49],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signInMain);
                        },
                        child: const Text(
                          Appstrings.login,
                          style: kTS14SpUnderLineBlack,
                        ),
                      ),
                      AppButton(
                        onTap: () {
                          var validat = _formKey.currentState!.validate();
                          if (validat) {
                            sharedObjectBloc.sharedObject.fullName =
                                _fullnameTextEditingController.text;
                            sharedObjectBloc.sharedObject.email =
                                _emailAddressTextEditingController.text;
                            sharedObjectBloc.sharedObject.phone =
                                _phoneNumberTextEditingController.text;
                            sharedObjectBloc.sharedObject.password =
                                _passwordTextEditingController.text;
                            Navigator.of(context)
                                .pushNamed(AppRoutes.signUpPage2);
                          }
                        },
                        child: const Center(
                          child: Text(
                            Appstrings.continueText,
                            style: kTS18White,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
