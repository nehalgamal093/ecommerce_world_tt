import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

Widget loginSuccessText(bool isRegisteredSuccess, BuildContext context) {
  return isRegisteredSuccess
      ? Text(
          S.of(context).signedUpSuccessfully,
          style: const TextStyle(color: Colors.green, fontSize: 17),
        )
      : Container();
}
//13✅