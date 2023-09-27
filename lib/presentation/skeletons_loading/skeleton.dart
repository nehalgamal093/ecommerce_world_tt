import 'package:flutter/material.dart';

Widget skeleton() {
  return Container(
    width: 200,
    height: 200,
    child: Column(
      children: [
        Container(
          width: 140,
          height: 150,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 244, 229, 247),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        const SizedBox(height: 10),
        Container(
          width: 140,
          height: 30,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 140,
          height: 10,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        )
      ],
    ),
  );
}
