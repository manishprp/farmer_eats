import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_spaces.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../../../constants/colors.dart';

class SignupDoneWidget extends StatelessWidget {
  const SignupDoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppIcons.doneIcon,
            alignment: Alignment.center,
          ),
          AppSizeConstants.heightConstants[24],
          const Text(
            Appstrings.youAreAllDone,
            style: kTS32SpBlackFont,
          ),
          AppSizeConstants.heightConstants[24],
          Text(
            textAlign: TextAlign.center,
            Appstrings.hangTightWeAreCurrentlyReviewing,
            style: kTS14SpUnderLineBlack.copyWith(
                color: AppColors.black.withOpacity(0.3),
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
