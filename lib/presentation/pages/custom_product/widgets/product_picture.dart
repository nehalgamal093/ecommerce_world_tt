import 'package:flutter/material.dart';

Widget productPicture(String imgCover) {
  return Container(
    padding: const EdgeInsets.all(5),
    width: 120,
    height: 120,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    child: Image.network(imgCover, fit: BoxFit.contain),
  );
}
//16✅