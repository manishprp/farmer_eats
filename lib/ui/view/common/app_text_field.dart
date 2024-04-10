import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget(
      {super.key,
      this.label,
      this.controller,
      required this.prefixIcon,
      this.suffixIon});
  final String? label;
  final TextEditingController? controller;
  final String? prefixIcon;
  final String? suffixIon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.black.withOpacity(0.08),
          hintStyle: TextStyle(color: AppColors.black.withOpacity(0.3)),
          border: InputBorder.none,
          prefixIcon: prefixIcon != null ? Image.asset(prefixIcon!) : null,
          suffixIcon: suffixIon != null ? Image.asset(suffixIon!) : null,
          hintText: label,
        ),
      ),
    );
  }
}
