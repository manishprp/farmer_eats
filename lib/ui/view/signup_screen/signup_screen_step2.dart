import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/app_icons.dart';
import '../../../constants/app_spaces.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../../../constants/colors.dart';
import '../../../routes/app_routes.dart';
import '../../../viewmodel/signup_bloc/bloc/signup_bloc_bloc.dart';
import '../common/app_button_widget.dart';
import '../common/app_text_field.dart';

List<Widget> signupDetailsWidgetList = [];

class SignUpScreenStep2Widget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _businessNameTextEditingController =
      TextEditingController(text: Appstrings.emptyString);
  final TextEditingController _informalNameTextEditingController =
      TextEditingController(text: Appstrings.emptyString);

  final TextEditingController _streetAddressTextEditingController =
      TextEditingController(text: Appstrings.emptyString);

  final TextEditingController _cityTextEditingController =
      TextEditingController(text: Appstrings.emptyString);

  final TextEditingController _stateTextEditingController =
      TextEditingController(text: Appstrings.emptyString);

  final TextEditingController _zipcodeTextEditingController =
      TextEditingController(text: Appstrings.emptyString);

  SignUpScreenStep2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    var keyboard = MediaQuery.of(context).viewInsets.bottom;
    final sharedObjectBloc = GetIt.I<SignupBlocBloc>();

    return Scaffold(
      floatingActionButton: keyboard == 0
          ? SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Image.asset(AppIcons.backArrowIcon)),
                  ),
                  AppButton(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        sharedObjectBloc.sharedObject.businessName =
                            _businessNameTextEditingController.text;
                        sharedObjectBloc.sharedObject.informalName =
                            _informalNameTextEditingController.text;
                        sharedObjectBloc.sharedObject.address =
                            _streetAddressTextEditingController.text;
                        sharedObjectBloc.sharedObject.city =
                            _cityTextEditingController.text;
                        sharedObjectBloc.sharedObject.zipCode =
                            int.tryParse(_zipcodeTextEditingController.text);
                        sharedObjectBloc.sharedObject.state =
                            _stateTextEditingController.text;
                        Navigator.of(context).pushNamed(AppRoutes.signUpPage3);
                      }
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
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
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
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppTextFieldWidget(
                              inputype: TextInputType.text,
                              validator: (businessName) {
                                if (businessName!.isEmpty) {
                                  return Appstrings
                                      .businessNameShouldNotBeEmpty;
                                }
                                return null;
                              },
                              controller: _businessNameTextEditingController,
                              label: Appstrings.businessName,
                              prefixIcon: AppIcons.tagIcon,
                            ),
                            AppSizeConstants.heightConstants[20],
                            AppTextFieldWidget(
                              inputype: TextInputType.text,
                              validator: (informalName) {
                                return null;
                              },
                              controller: _informalNameTextEditingController,
                              label: Appstrings.informalName,
                              prefixIcon: AppIcons.smilyIcon,
                            ),
                            AppSizeConstants.heightConstants[20],
                            AppTextFieldWidget(
                              inputype: TextInputType.streetAddress,
                              validator: (streetAddress) {
                                if (streetAddress!.isEmpty) {
                                  return Appstrings
                                      .streetAddressShouldNotBeEmpty;
                                }
                                return null;
                              },
                              controller: _streetAddressTextEditingController,
                              label: Appstrings.streetAddress,
                              prefixIcon: AppIcons.homeIcon,
                            ),
                            AppSizeConstants.heightConstants[20],
                            AppTextFieldWidget(
                              inputype: TextInputType.text,
                              validator: (city) {
                                if (city!.isEmpty) {
                                  return Appstrings.cityShouldNotBeEmpty;
                                }
                                return null;
                              },
                              controller: _cityTextEditingController,
                              label: Appstrings.city,
                              prefixIcon: AppIcons.locationIcon,
                            ),
                            AppSizeConstants.heightConstants[20],
                            // state and zip code
                            Row(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: AppTextFieldWidget(
                                    inputype: TextInputType.text,
                                    validator: (state) {
                                      if (state!.isEmpty) {
                                        return Appstrings.stateShouldNotBeEmpty;
                                      }
                                      return null;
                                    },
                                    controller: _stateTextEditingController,
                                    label: Appstrings.state,
                                    suffixIon:
                                        Image.asset(AppIcons.dropDownIcon),
                                    prefixIcon: null,
                                  ),
                                ),
                                AppSizeConstants.widthConstants[17],
                                Flexible(
                                  flex: 3,
                                  child: AppTextFieldWidget(
                                    inputype: TextInputType.number,
                                    validator: (zipcode) {
                                      if (zipcode!.isEmpty) {
                                        return Appstrings
                                            .zipcodeShouldNotBeEmpty;
                                      }
                                      return null;
                                    },
                                    controller: _zipcodeTextEditingController,
                                    label: Appstrings.enterZipcode,
                                    prefixIcon: null,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
