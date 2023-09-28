import 'package:flutter/material.dart';

Widget profileLabel(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );
}
