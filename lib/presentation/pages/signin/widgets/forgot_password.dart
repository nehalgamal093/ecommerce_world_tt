import 'package:flutter/material.dart';
import 'package:world_commerce/generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../forget_password/forget_password.dart';

Widget forgotPassword(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ForgetPassword(),
            ),
          );
        },
        child: Text(
          S.of(context).forgotPassword,
          style: const TextStyle(
              color: ColorManager.grey, decoration: TextDecoration.underline),
        ),
      ),
    ],
  );
}
//28✅