import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_textstyles.dart';
import '../../../constants/colors.dart';

class CustomRichTextWidget extends StatelessWidget {
  const CustomRichTextWidget(
      {super.key,
      this.nonClickableText = "",
      this.clickableText = "",
      this.onTap});

  final String nonClickableText;
  final String clickableText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: nonClickableText,
              style: kTS14SpLightBlack.copyWith(
                  color: AppColors.blackFont.withOpacity(0.3))),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: " $clickableText",
            style: kTS14SpLightBlack.copyWith(
              color: AppColors.buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}
