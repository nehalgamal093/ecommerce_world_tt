import 'package:flutter/material.dart';

Widget mainBtn(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return Container(
    padding: const EdgeInsets.all(10),
    width: width * 60,
    height: 50,
    decoration: const BoxDecoration(color: Colors.green),
    child: const Align(
      alignment: Alignment.center,
      child: Text(
        'Continue',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    ),
  );
}
