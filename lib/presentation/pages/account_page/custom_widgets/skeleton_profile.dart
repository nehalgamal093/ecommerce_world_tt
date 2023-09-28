import 'package:flutter/material.dart';

Widget skeletonProfile() {
  return Column(
    children: [
      CircleAvatar(
        radius: 60,
        backgroundColor: Color.fromARGB(255, 244, 229, 247),
      ),
      SizedBox(height: 10),
      Container(
        width: 100,
        height: 30,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      SizedBox(height: 10),
      Container(
        width: 80,
        height: 30,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      SizedBox(height: 50),
      Container(
        width: 450,
        height: 50,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      SizedBox(height: 30),
      Container(
        width: 450,
        height: 50,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      SizedBox(height: 30),
      Container(
        width: 450,
        height: 50,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      SizedBox(height: 30),
      Container(
        width: 450,
        height: 50,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      SizedBox(height: 30),
      Container(
        width: 450,
        height: 50,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      SizedBox(height: 30),
      Container(
        width: 450,
        height: 50,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 229, 247),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      SizedBox(height: 30),
    ],
  );
}
