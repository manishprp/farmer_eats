import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_spaces.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../common/app_button_widget.dart';
import '../common/app_text_field.dart';
import '../common/custom_richtext_widget.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

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
                    Appstrings.resetPassword,
                    style: kTS32SpBlackFont,
                  ),
                  AppSizeConstants.heightConstants[20],
                  CustomRichTextWidget(
                    nonClickableText: Appstrings.rememberYourPasword,
                    clickableText: Appstrings.login,
                    onTap: () {},
                  ),
                  AppSizeConstants.heightConstants[40],
                  const AppTextFieldWidget(
                      prefixIcon: AppIcons.passwordIcon,
                      label: Appstrings.newPassword),
                  AppSizeConstants.heightConstants[20],
                  const AppTextFieldWidget(
                      prefixIcon: AppIcons.passwordIcon,
                      label: Appstrings.confirmNewPassword),
                  AppSizeConstants.heightConstants[25],
                  AppButton(
                    onTap: () {},
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: Text(
                        Appstrings.submit,
                        style: kTS18White,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
