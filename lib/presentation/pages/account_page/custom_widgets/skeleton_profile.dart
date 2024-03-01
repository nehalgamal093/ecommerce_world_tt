import 'package:flutter/material.dart';

Widget skeletonProfile() {
  return Column(
    children: [
      customSized(50),
      const CircleAvatar(
        radius: 60,
      ),
      customSized(10),
      customCard(100, 30),
      customSized(10),
      customCard(80, 30),
      customSized(50),
      customCard(450, 50),
      customSized(30),
      customCard(450, 50),
      customSized(30),
      customCard(450, 50),
      customSized(30),
      customCard(450, 50),
    ],
  );
}

Widget customCard(double width, double height) {
  return Card(
    child: SizedBox(
      width: width,
      height: height,
    ),
  );
}

Widget customSized(double height) {
  return SizedBox(height: height);
}
//38 ✅
