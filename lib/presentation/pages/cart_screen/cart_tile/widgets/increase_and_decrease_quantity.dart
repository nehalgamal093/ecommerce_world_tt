import 'package:flutter/material.dart';
import '../../../../resources/color_manager.dart';

Widget increaseAndDecreaseQuantity() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('-'),
      SizedBox(
        height: 10,
      ),
      Text('1'),
      SizedBox(
        height: 10,
      ),
      CircleAvatar(
        radius: 15,
        backgroundColor: ColorManager.lightOrange,
        child: Text('+'),
      )
    ],
  );
}
//24 ✅
