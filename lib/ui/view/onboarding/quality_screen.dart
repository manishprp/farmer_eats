import 'package:farmer_eats/constants/app_spaces.dart';
import 'package:farmer_eats/ui/view/common/app_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../../../constants/colors.dart';

class QualityScreen extends StatelessWidget {
  const QualityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            width: width,
            color: AppColors.greenishBgColor,
            child: Column(
              children: [
                Image.asset(AppIcons.qualityImage),
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
                          Appstrings.quality,
                          style: kTS24FW700black,
                        ),
                        AppSizeConstants.heightConstants[30],
                        const Text(
                          textAlign: TextAlign.center,
                          Appstrings.sellYourFarmFreshProducts,
                          style: kTS14FW400BlackFont,
                        ),
                        AppSizeConstants.heightConstants[30],
                        const CustomIndicatorWidget(
                          selectedPage: 1,
                        ),
                        AppSizeConstants.heightConstants[30],
                        AppButton(
                          onTap: () {},
                          color: AppColors.greenishBgColor,
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
//
        // SizedBox(
        //   height: height / 2,
        //   width: width,
        //   child: const Column(
        //     children: [
        //       Text(
        //         Appstrings.quality,
        //         style: kTS24FW700black,
        //       )
        //     ],
        //   ),
        // )
      ],
    ));
  }
}

class CustomIndicatorWidget extends StatelessWidget {
  const CustomIndicatorWidget({super.key, this.selectedPage = 1});
  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 7,
          width: selectedPage == 1 ? 14 : 7,
          decoration: const BoxDecoration(
              color: AppColors.blackFont,
              borderRadius: BorderRadius.all(Radius.circular(3.5))),
        ),
        AppSizeConstants.widthConstants[3],
        Container(
          height: 7,
          width: selectedPage == 2 ? 14 : 7,
          decoration: const BoxDecoration(
              color: AppColors.blackFont,
              borderRadius: BorderRadius.all(Radius.circular(3.5))),
        ),
        AppSizeConstants.widthConstants[3],
        Container(
          height: 7,
          width: selectedPage == 3 ? 14 : 7,
          decoration: const BoxDecoration(
              color: AppColors.blackFont,
              borderRadius: BorderRadius.all(Radius.circular(3.5))),
        ),
      ],
    );
  }
}
