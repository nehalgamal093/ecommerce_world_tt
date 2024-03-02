import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../custom_product/span_text.dart';
import '../../signup/signup.dart';

Widget donotHaveAccountBtn(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Signup(),
        ),
      );
    },
    child: spanText(context, S.of(context).dontHavAccount,
        S.of(context).siginup, ColorManager.black, ColorManager.blue),
  );
}
//20✅
