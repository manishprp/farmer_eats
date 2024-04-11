import 'dart:math';

import 'package:farmer_eats/routes/app_routes.dart';
import 'package:farmer_eats/services/file_picker.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_spaces.dart';
import '../../../constants/app_textstyles.dart';
import '../common/app_button_widget.dart';

class SignUpScreenStep3Widget extends StatelessWidget {
  SignUpScreenStep3Widget({super.key});
  final filePicker = GetIt.I<FilePickerClass>();

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
                    Appstrings.signup3Of4,
                    style: kTS14SpLightBlack.copyWith(
                        color: AppColors.black.withOpacity(0.3)),
                  ),
                  AppSizeConstants.heightConstants[10],
                  const Text(
                    Appstrings.verification,
                    style: kTS32SpBlackFont,
                  ),
                  AppSizeConstants.heightConstants[24],
                  Text(
                    Appstrings
                        .attachedProofOfDepartmentOfAgricultureRegistrations,
                    style: kTS14SpUnderLineBlack.copyWith(
                        color: AppColors.black.withOpacity(0.3),
                        decoration: TextDecoration.none),
                  ),
                  AppSizeConstants.heightConstants[49],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Appstrings.attackProofOfRegistration,
                        style: kTS14SpUnderLineBlack.copyWith(
                            color: AppColors.blackFont,
                            decoration: TextDecoration.none),
                      ),
                      AppButton(
                        onTap: () async {
                          try {
                            var file =
                                await filePicker.filePick(context: context);
                          } catch (e) {}
                        },
                        borderRadius: 26.5,
                        width: 53,
                        height: 53,
                        child: Center(child: Image.asset(AppIcons.camIcon)),
                      )
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
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.signUpPage4);
                        },
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
