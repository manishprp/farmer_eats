import '../../../constants/app_icons.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_spaces.dart';
import '../../../constants/app_textstyles.dart';
import '../common/app_button_widget.dart';
import '../common/app_text_field.dart';
import 'signup_options_widget.dart';

class SignUpScreenStep2Widget extends StatelessWidget {
  const SignUpScreenStep2Widget({super.key});

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
                    Appstrings.signup2Of4,
                    style: kTS14SpLightBlack.copyWith(
                        color: AppColors.black.withOpacity(0.3)),
                  ),
                  AppSizeConstants.heightConstants[10],
                  const Text(
                    Appstrings.farmInfo,
                    style: kTS32SpBlackFont,
                  ),
                  AppSizeConstants.heightConstants[29],
                  AppTextFieldWidget(
                    label: Appstrings.businessName,
                    prefixIcon: AppIcons.tagIcon,
                  ),
                  AppSizeConstants.heightConstants[20],
                  AppTextFieldWidget(
                    label: Appstrings.informalName,
                    prefixIcon: AppIcons.smilyIcon,
                  ),
                  AppSizeConstants.heightConstants[20],
                  AppTextFieldWidget(
                    label: Appstrings.streetAddress,
                    prefixIcon: AppIcons.homeIcon,
                  ),
                  AppSizeConstants.heightConstants[20],
                  AppTextFieldWidget(
                    label: Appstrings.city,
                    prefixIcon: AppIcons.locationIcon,
                  ),
                  AppSizeConstants.heightConstants[20],
                  // state and zip
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: AppTextFieldWidget(
                          label: Appstrings.state,
                          suffixIon: AppIcons.dropDownIcon,
                          prefixIcon: null,
                        ),
                      ),
                      AppSizeConstants.widthConstants[17],
                      Flexible(
                        flex: 3,
                        child: AppTextFieldWidget(
                          label: Appstrings.enterZipcode,
                          prefixIcon: null,
                        ),
                      ),
                    ],
                  ),
                  AppSizeConstants.heightConstants[49],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppIcons.backArrowIcon)),
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

List<Widget> signupDetailsWidgetList = [];
