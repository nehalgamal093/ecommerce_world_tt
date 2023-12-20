import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

Widget formField(BuildContext context, String title,
    TextEditingController controller, Icon icon) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    padding: const EdgeInsets.all(3),
    margin: const EdgeInsets.symmetric(vertical: 2),
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
            borderSide: BorderSide(color: Color.fromARGB(207, 215, 213, 212))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(207, 215, 213, 212))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(207, 215, 213, 212))),
      ),
    ),
  );
}
