import 'package:flutter/material.dart';

Widget btn(String title) {
  return Container(
    width: 100,
    height: 40,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 86, 179, 255),
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    child: Center(
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}
