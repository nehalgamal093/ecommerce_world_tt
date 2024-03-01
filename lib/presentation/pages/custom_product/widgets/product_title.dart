import 'package:flutter/material.dart';

Widget productTitle(String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    overflow: TextOverflow.ellipsis,
  );
}
//10✅