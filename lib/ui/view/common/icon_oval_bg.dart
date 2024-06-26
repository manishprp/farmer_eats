import 'package:farmer_eats/constants/colors.dart';

import 'package:flutter/material.dart';

class IconOvalBGWidget extends StatelessWidget {
  const IconOvalBGWidget({super.key, this.icon});

  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border(
          top: BorderSide(
            color: AppColors.black.withOpacity(0.08),
          ),
          bottom: BorderSide(
            color: AppColors.black.withOpacity(0.08),
          ),
          left: BorderSide(
            color: AppColors.black.withOpacity(0.08),
          ),
          right: BorderSide(
            color: AppColors.black.withOpacity(0.08),
          ),
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(icon!),
      ),
    );
  }
}
