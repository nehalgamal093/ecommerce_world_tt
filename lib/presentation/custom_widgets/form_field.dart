import 'package:flutter/material.dart';

Widget formField(BuildContext context, String title,
    TextEditingController controller, Icon icon) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    padding: const EdgeInsets.all(3),
    margin: const EdgeInsets.symmetric(vertical: 2),
    child: TextField(
      controller: controller,
    ),
  );
}
