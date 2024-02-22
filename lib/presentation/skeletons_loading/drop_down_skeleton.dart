import 'package:flutter/material.dart';

Widget dropDownSkeleton() {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 229, 247),
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        );
      });
}
