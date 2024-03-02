import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../custom_product/span_text.dart';

Widget termsAndConditionsText(BuildContext context) {
  return spanText(context, S.of(context).byConnecting,
      S.of(context).termsAndConditions, ColorManager.black, ColorManager.blue);
}
//11✅