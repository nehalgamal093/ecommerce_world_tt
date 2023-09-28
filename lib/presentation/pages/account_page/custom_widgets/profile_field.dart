import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';

Widget profileField(String hintText, bool isSecured) {
  return TextField(
    obscureText: isSecured ? true : false,
    decoration: InputDecoration(
      filled: true,
      fillColor: ColorManager.lightGrey,
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      hintText: hintText,
      hintStyle: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(color: ColorManager.lightGrey, width: 5),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(color: ColorManager.lightGrey, width: 5),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(color: ColorManager.lightGrey, width: 5),
      ),
    ),
  );
}
