import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_spaces.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../../../constants/colors.dart';
import '../common/app_button_widget.dart';
import '../common/app_text_field.dart';
import '../common/custom_richtext_widget.dart';
import '../common/signup_options_widget.dart';

class SignInMain extends StatelessWidget {
  const SignInMain({super.key});

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
                    onTap: () {},
                  ),
                  AppSizeConstants.heightConstants[40],
                  const AppTextFieldWidget(
                      prefixIcon: AppIcons.atIcon,
                      label: Appstrings.emailAddress),
                  AppSizeConstants.heightConstants[20],
                  AppTextFieldWidget(
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
                  AppSizeConstants.heightConstants[25],
                  AppButton(
                    onTap: () {},
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: Text(
                        Appstrings.login,
                        style: kTS18White,
                      ),
                    ),
                  ),
                  AppSizeConstants.heightConstants[30],
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      Appstrings.orloginWith,
                      style: kTS10SpLightBlackW400.copyWith(
                          color: AppColors.blackFont.withOpacity(0.3)),
                    ),
                  ]),
                  AppSizeConstants.heightConstants[30],
                  const SignupOptionsWidget(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
