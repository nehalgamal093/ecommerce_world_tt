import 'package:flutter/material.dart';

Widget productPrice(String price) {
  return SizedBox(
    width: 250,
    child: Text(
      '$price \$',
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );
}
//12 ✅