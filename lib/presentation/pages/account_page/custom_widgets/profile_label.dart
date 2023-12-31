import 'package:flutter/material.dart';

Widget profileLabel(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black26),
    ),
  );
}
