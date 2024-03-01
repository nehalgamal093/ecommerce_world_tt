import 'package:flutter/material.dart';

Widget productAndPrice(String product, String price) {
  return Row(
    children: [
      Text(
        product,
        style: const TextStyle(fontSize: 16),
      ),
      const Spacer(),
      Text(
        price,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
    ],
  );
}
