import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      this.onTap,
      this.child,
      this.color,
      this.height,
      this.width,
      this.borderRadius});
  Function()? onTap;
  Widget? child;
  Color? color;
  double? height;
  double? width;
  double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: height ?? 52,
      width: width ?? 226,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 117))),
      child: Material(
        color: color ?? AppColors.buttonColor,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
