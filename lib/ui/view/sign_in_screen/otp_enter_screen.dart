import 'package:farmer_eats/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/app_spaces.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../../../constants/colors.dart';
import '../../../viewmodel/otp_verify/OTP_verify_bloc.dart';
import '../common/app_button_widget.dart';
import '../common/custom_richtext_widget.dart';

class OtpEnterScreen extends StatelessWidget {
  OtpEnterScreen({super.key});
  final TextEditingController _otpTextEditingController =
      TextEditingController(text: Appstrings.emptyString);
  @override
  Widget build(BuildContext context) {
    var verifyOtpBloc = GetIt.I<OTPVerifyBLoc>();
    return Scaffold(
      body: BlocConsumer<OTPVerifyBLoc, OTPVerifyState>(
          bloc: verifyOtpBloc,
          listener: (context, state) {
            if (state is OTPVerifySuccess) {
              Navigator.of(context).pushNamed(AppRoutes.resetPasswordScreen);
            }
            if (state is OTPVerifydFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Something went wrong!")));
            }
          },
          builder: (context, state) {
            if (state is OTPVerifyLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
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
                        AppSizeConstants.heightConstants[20],
                        const CustomRichTextWidget(
                          nonClickableText: Appstrings.rememberYourPasword,
                          clickableText: Appstrings.login,
                        ),
                        AppSizeConstants.heightConstants[40],
                        OtpInputWidget(
                          onValueChanded: (inputOtp) {
                            _otpTextEditingController.text += inputOtp;
                          },
                        ),
                        AppSizeConstants.heightConstants[20],
                        AppSizeConstants.heightConstants[25],
                        AppButton(
                          onTap: () {
                            if (_otpTextEditingController.text.length == 5) {
                              // otp entered\
                              verifyOtpBloc.otpVerifyModel.otp =
                                  _otpTextEditingController.text;
                              verifyOtpBloc.add(OTPVerifySendEvent());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please Enter Otp"),
                                ),
                              );
                            }
                          },
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
            );
          }),
    );
  }
}

class OtpInputWidget extends StatefulWidget {
  OtpInputWidget({super.key, this.onValueChanded});

  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
  Function(String num)? onValueChanded;
}

List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());
List<TextEditingController> _controllers =
    List.generate(5, (index) => TextEditingController());

class _OtpInputWidgetState extends State<OtpInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            5,
            (index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: null,
                      color: AppColors.blackFont.withOpacity(0.08)),
                  width: 58,
                  height: 59,
                  child: TextFormField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < 4) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index + 1]);
                        } else {
                          String otp = _controllers
                              .map((controller) => controller.text)
                              .join();
                        }
                      }
                      if (value.isEmpty) {
                        if (index > 0) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index - 1]);
                        }
                      }
                      if (widget.onValueChanded != null) {
                        widget.onValueChanded!(value);
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: AppColors.blackFont.withOpacity(0.08),
                      counterText: '', // Hide character counter
                      border: const OutlineInputBorder(),
                    ),
                  ),
                )));
  }
}
