import 'package:flutter/material.dart';

Widget productPrice(String price) {
  return Text(
    '$price \$',
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );
}
//9✅