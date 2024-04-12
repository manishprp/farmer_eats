import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget(
      {super.key,
      this.label,
      this.controller,
      required this.prefixIcon,
      this.suffixIon,
      this.inputype = TextInputType.none,
      this.validator});
  final String? label;
  final TextEditingController? controller;
  final String? prefixIcon;
  final Widget? suffixIon;
  final String? Function(String?)? validator;
  final TextInputType? inputype;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      //height: 48,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: TextFormField(
          keyboardType: inputype,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            filled: true,
            fillColor: AppColors.black.withOpacity(0.08),
            hintStyle: TextStyle(color: AppColors.black.withOpacity(0.3)),
            border: InputBorder.none,
            prefixIcon: prefixIcon != null
                ? SizedBox(
                    height: 28, width: 28, child: Image.asset(prefixIcon!))
                : null,
            suffixIcon: suffixIon,
            hintText: label,
          ),
          validator: validator,
        ),
      ),
    );
  }
}
