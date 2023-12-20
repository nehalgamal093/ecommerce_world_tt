import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';

Widget profileField(String hintText, bool isSecured, bool readOnly,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isSecured ? true : false,
    readOnly: readOnly,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      hintText: hintText,
      hintStyle: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        borderSide: BorderSide(color: ColorManager.lightGrey),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        borderSide: BorderSide(color: ColorManager.lightGrey),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        borderSide: BorderSide(color: ColorManager.lightGrey),
      ),
    ),
  );
}
