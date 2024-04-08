import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';

class SignupDoneWidget extends StatelessWidget {
  const SignupDoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppIcons.doneIcon,
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
