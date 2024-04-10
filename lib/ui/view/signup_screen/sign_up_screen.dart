import '../../../constants/app_icons.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_spaces.dart';
import '../../../constants/app_textstyles.dart';
import '../common/app_button_widget.dart';
import '../common/app_text_field.dart';
import 'signup_options_widget.dart';

class SignUpScreenWidget extends StatelessWidget {
  const SignUpScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                  ...signupDetailsWidgetList,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        Appstrings.login,
                        style: kTS14SpUnderLineBlack,
                      ),
                      AppButton(
                        onTap: () {},
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

List<Widget> signupDetailsWidgetList = [
  AppSizeConstants.heightConstants[29],
  const AppTextFieldWidget(
    label: Appstrings.fullName,
    prefixIcon: AppIcons.userIcon,
  ),
  AppSizeConstants.heightConstants[20],
  const AppTextFieldWidget(
    label: Appstrings.emailAddress,
    prefixIcon: AppIcons.atIcon,
  ),
  AppSizeConstants.heightConstants[20],
  const AppTextFieldWidget(
    label: Appstrings.phoneNumber,
    prefixIcon: AppIcons.callIcon,
  ),
  AppSizeConstants.heightConstants[20],
  const AppTextFieldWidget(
    label: Appstrings.password,
    prefixIcon: AppIcons.passwordIcon,
  ),
  AppSizeConstants.heightConstants[20],
  const AppTextFieldWidget(
    label: Appstrings.reEnterPassword,
    prefixIcon: AppIcons.passwordIcon,
  ),
  AppSizeConstants.heightConstants[49],
];
