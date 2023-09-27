import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';

class InputText extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  const InputText(
      {super.key,
      required this.labelText,
      required this.icon,
      required this.hintText,
      required this.isPassword,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                labelText,
                style: const TextStyle(
                    color: ColorManager.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            suffixIcon: isPassword
                ? const Icon(
                    Icons.remove_red_eye_outlined,
                    color: ColorManager.grey,
                  )
                : null,
            prefixIcon: Icon(
              icon,
              color: ColorManager.grey,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: ColorManager.grey),
            filled: true,
            fillColor: ColorManager.lightGrey,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5.0)
      ],
    );
  }
}
