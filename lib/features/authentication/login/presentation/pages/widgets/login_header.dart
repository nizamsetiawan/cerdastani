import 'package:cerdastani/widgets/widgets.dart';
import 'package:flutter/material.dart';


import '../../../../../../utils/utils.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
            height: 80,
            image: AssetImage(
                SMAssetPaths.logoLauncher
            )),
        const SizedBox(
          height: SMDimens.size8,
        ),
        Text(SMDisplayStrings.titleLogin,
            style: SMFontPoppins.header4Bold),
        const SizedBox(height: SMDimens.size8),
        Text(SMDisplayStrings.subtitleLogin,
            style: SMFontPoppins.actionMedium12),
      ],
    );
  }
}
