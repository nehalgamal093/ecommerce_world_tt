import 'package:flutter/material.dart';

Widget skeletonProfile() {
  return Column(
    children: [
      CircleAvatar(
        radius: 60,
      ),
      SizedBox(height: 10),
      Card(
        child: SizedBox(
          width: 100,
          height: 30,
        ),
      ),
      SizedBox(height: 10),
      Card(
        child: SizedBox(
          width: 80,
          height: 30,
        ),
      ),
      SizedBox(height: 50),
      Card(
        child: SizedBox(
          width: 450,
          height: 50,
        ),
      ),
      SizedBox(height: 30),
      Card(
        child: SizedBox(
          width: 450,
          height: 50,
        ),
      ),
      SizedBox(height: 30),
      Card(
        child: SizedBox(
          width: 450,
          height: 50,
        ),
      ),
      SizedBox(height: 30),
      Card(
        child: SizedBox(
          width: 450,
          height: 50,
        ),
      ),
      SizedBox(height: 30),
      Card(
        child: SizedBox(
          width: 450,
          height: 50,
        ),
      ),
      SizedBox(height: 30),
      Card(
        child: SizedBox(
          width: 450,
          height: 50,
        ),
      ),
      SizedBox(height: 30),
    ],
  );
}
