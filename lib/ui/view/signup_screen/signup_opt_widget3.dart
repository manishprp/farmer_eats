import 'package:farmer_eats/routes/app_routes.dart';
import 'package:farmer_eats/services/file_picker.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_spaces.dart';
import '../../../constants/app_textstyles.dart';
import '../../../viewmodel/signup_bloc/bloc/signup_bloc_bloc.dart';
import '../common/app_button_widget.dart';

class SignUpScreenStep3Widget extends StatefulWidget {
  const SignUpScreenStep3Widget({super.key});

  @override
  State<SignUpScreenStep3Widget> createState() =>
      _SignUpScreenStep3WidgetState();
}

class _SignUpScreenStep3WidgetState extends State<SignUpScreenStep3Widget> {
  final filePicker = GetIt.I<FilePickerClass>();

  String filename = "";

  @override
  Widget build(BuildContext context) {
    final sharedObjectBloc = GetIt.I<SignupBlocBloc>();

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(AppIcons.backArrowIcon)),
          ),
          AppButton(
            onTap: () {
              sharedObjectBloc.sharedObject.registrationProof = filename;
              Navigator.of(context).pushNamed(AppRoutes.signUpPage4);
            },
            child: const Center(
              child: Text(
                Appstrings.continueText,
                style: kTS18White,
              ),
            ),
          ),
        ],
      ),
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
                            if (file != null) {
                              setState(() {
                                filename = file.name;
                              });
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Something went Wrong"),
                            ));
                          }
                        },
                        borderRadius: 26.5,
                        width: 53,
                        height: 53,
                        child: Center(child: Image.asset(AppIcons.camIcon)),
                      ),
                    ],
                  ),
                  AppSizeConstants.heightConstants[49],
                  Container(
                    height: 48,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.08),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            filename,
                            style: kTS14SpUnderLineBlack,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  filename = "";
                                });
                              },
                              icon: const Icon(Icons.cancel_presentation))
                        ],
                      ),
                    ),
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
