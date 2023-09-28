import 'package:flutter/material.dart';

Widget dropDownSkeleton() {
  return Column(
    children: [
      Container(
        width: 300,
        height: 50,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      const SizedBox(height: 5),
    ],
  );
}
