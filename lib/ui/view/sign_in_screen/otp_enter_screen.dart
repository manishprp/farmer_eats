import 'package:farmer_eats/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_spaces.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_textstyles.dart';
import '../common/app_button_widget.dart';
import '../common/custom_richtext_widget.dart';

class OtpEnterScreen extends StatelessWidget {
  OtpEnterScreen({super.key});
  final TextEditingController _otpTextEditingController =
      TextEditingController(text: Appstrings.emptyString);
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
                  AppSizeConstants.heightConstants[20],
                  const CustomRichTextWidget(
                    nonClickableText: Appstrings.rememberYourPasword,
                    clickableText: Appstrings.login,
                  ),
                  AppSizeConstants.heightConstants[40],
                  OtpInputWidget(
                    onValueChanded: (inputOtp) {
                      _otpTextEditingController.text = inputOtp;
                    },
                  ),
                  AppSizeConstants.heightConstants[20],
                  AppSizeConstants.heightConstants[25],
                  AppButton(
                    onTap: () {
                      if (_otpTextEditingController.text.length == 5) {
                        // otp entered
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please Enter Otp")));
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
      ),
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
                          if (widget.onValueChanded != null) {
                            widget.onValueChanded!(value);
                          }
                        }
                      }
                      if (value.isEmpty) {
                        if (index > 0) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index - 1]);
                        }
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
