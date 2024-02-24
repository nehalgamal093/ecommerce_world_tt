import 'package:flutter/material.dart';

Widget profileField(String hintText, bool isSecured, bool readOnly,
    TextEditingController controller, BuildContext context) {
  return TextField(
    style: Theme.of(context).textTheme.bodyMedium,
    controller: controller,
    obscureText: isSecured ? true : false,
    readOnly: readOnly,
    decoration: InputDecoration(
      hintText: hintText,
    ),
  );
}
