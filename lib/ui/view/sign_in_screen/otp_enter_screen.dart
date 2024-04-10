import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_spaces.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../common/app_button_widget.dart';
import '../common/app_text_field.dart';
import '../common/custom_richtext_widget.dart';

class OtpEnterScreen extends StatelessWidget {
  const OtpEnterScreen({super.key});

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
                    Appstrings.verifyOTP,
                    style: kTS32SpBlackFont,
                  ),
                  AppSizeConstants.heightConstants[20],
                  const CustomRichTextWidget(
                    nonClickableText: Appstrings.rememberYourPasword,
                    clickableText: Appstrings.login,
                  ),
                  AppSizeConstants.heightConstants[40],
                  const AppTextFieldWidget(
                      prefixIcon: AppIcons.callIcon,
                      label: Appstrings.phoneNumber),
                  AppSizeConstants.heightConstants[20],
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
                  AppSizeConstants.heightConstants[15],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          Appstrings.resendCode,
                          style: kTS14SpLightBlack.copyWith(
                              decoration: TextDecoration.underline),
                        ),
                      )
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
