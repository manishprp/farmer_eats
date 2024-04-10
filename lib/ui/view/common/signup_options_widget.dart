import 'package:flutter/widgets.dart';

import '../../../constants/app_icons.dart';
import '../common/icon_oval_bg.dart';

class SignupOptionsWidget extends StatelessWidget {
  const SignupOptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconOvalBGWidget(
          icon: AppIcons.googleLogo,
        ),
        IconOvalBGWidget(
          icon: AppIcons.appleLogo,
        ),
        IconOvalBGWidget(
          icon: AppIcons.fbLogo,
        ),
      ],
    );
  }
}
