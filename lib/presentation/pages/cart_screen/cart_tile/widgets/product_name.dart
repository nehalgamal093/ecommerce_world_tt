import 'package:flutter/material.dart';

Widget productName(String title) {
  return SizedBox(
    width: 250,
    child: Text(
      title,
      style: const TextStyle(fontSize: 15),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: false,
    ),
  );
}
//15 ✅