import 'package:flutter/material.dart';

Widget productImage(String image) {
  return Container(
    padding: const EdgeInsets.all(5),
    width: 100,
    height: 120,
    child: Image.network(image, fit: BoxFit.cover),
  );
}
//11 ✅
