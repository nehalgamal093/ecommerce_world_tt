import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

Widget formField(BuildContext context, String title,
    TextEditingController controller, Icon icon) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: ColorManager.medGrey),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: icon,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24, width: 5)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24, width: 5)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24, width: 5)),
      ),
    ),
  );
}
