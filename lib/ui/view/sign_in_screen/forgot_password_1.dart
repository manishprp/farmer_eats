import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_spaces.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../../../routes/app_routes.dart';
import '../../../viewmodel/forgot_password_bloc/bloc/forgot_password_bloc.dart';
import '../common/app_button_widget.dart';
import '../common/app_text_field.dart';
import '../common/custom_richtext_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _phoneNumberTextEditingController =
      TextEditingController(text: Appstrings.emptyString);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var forgotBloc = GetIt.I<ForgotPasswordBloc>();
    return Scaffold(
      body: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        bloc: forgotBloc,
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            Navigator.of(context).pushNamed(AppRoutes.verifyOtpScreen);
          }
          if (state is ForgotPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Something went wrong!")));
          }
        },
        builder: (context, state) {
          if (state is ForgotPasswordLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
                        Appstrings.forgotPassword,
                        style: kTS32SpBlackFont,
                      ),
                      AppSizeConstants.heightConstants[20],
                      CustomRichTextWidget(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        nonClickableText: Appstrings.rememberYourPasword,
                        clickableText: Appstrings.login,
                      ),
                      AppSizeConstants.heightConstants[40],
                      Form(
                        key: _formKey,
                        child: AppTextFieldWidget(
                            validator: (phoneNumber) {
                              if (phoneNumber!.length != 10) {
                                return "Invalid phone number";
                              }
                              return null;
                            },
                            controller: _phoneNumberTextEditingController,
                            inputype: TextInputType.phone,
                            prefixIcon: AppIcons.callIcon,
                            label: Appstrings.phoneNumber),
                      ),
                      AppSizeConstants.heightConstants[20],
                      AppSizeConstants.heightConstants[25],
                      AppButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            forgotBloc.forgotModel.mobile =
                                _phoneNumberTextEditingController.text;
                            forgotBloc.add(ForgotPasswordSendCodeEvent());
                          }
                        },
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            Appstrings.sendCode,
                            style: kTS18White,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
