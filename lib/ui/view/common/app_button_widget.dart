import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.onTap,
      this.child,
      this.color,
      this.height,
      this.width,
      this.borderRadius});
  final Function()? onTap;
  final Widget? child;
  final Color? color;
  final double? height;
  final double? width;
  final double? borderRadius;

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
