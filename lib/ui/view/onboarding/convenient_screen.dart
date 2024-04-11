import '../../../constants/app_spaces.dart';
import '../common/app_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../../../constants/colors.dart';
import '../../../routes/app_routes.dart';
import 'quality_screen.dart';

class ConvenientScreen extends StatelessWidget {
  const ConvenientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            width: width,
            color: AppColors.yellorangish,
            child: Column(
              children: [
                Image.asset(AppIcons.convnientImage),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: width,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        const Text(
                          Appstrings.convenient,
                          style: kTS24FW700black,
                        ),
                        AppSizeConstants.heightConstants[30],
                        const Text(
                          textAlign: TextAlign.center,
                          Appstrings.weLoveTheEarthAndKnow,
                          style: kTS14FW400BlackFont,
                        ),
                        AppSizeConstants.heightConstants[30],
                        const CustomIndicatorWidget(
                          selectedPage: 2,
                        ),
                        AppSizeConstants.heightConstants[30],
                        AppButton(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.signUpPage1);
                          },
                          color: AppColors.yellorangish,
                          width: width - 40,
                          child: const Center(
                            child: Text(
                              Appstrings.joinTheMovement,
                              style: kTS18White,
                            ),
                          ),
                        ),
                        AppSizeConstants.heightConstants[30],
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            Appstrings.login,
                            style: kTS14SpUnderLineBlack.copyWith(
                                color: AppColors.blackFont,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
