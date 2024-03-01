import 'package:flutter/material.dart';
import '../../../../../resources/assets_manager.dart';

Widget sheetHeader() {
  return Row(
    children: [
      const Text(
        'Total Order',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      Image.asset(
        AssetsManager.visa,
        width: 100,
        height: 80,
      )
    ],
  );
}
//20 ✅