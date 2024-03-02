import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../signin/signin.dart';

Widget alreadyHaveAccountText(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        S.of(context).alreadyHaveAccount,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      const SizedBox(width: 3.0),
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Signin(
                isRegisteredSuccess: false,
              ),
            ),
          );
        },
        child: Text(
          S.of(context).login,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    ],
  );
}
//22✅