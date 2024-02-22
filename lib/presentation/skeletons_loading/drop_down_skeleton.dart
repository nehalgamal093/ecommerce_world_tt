import 'package:flutter/material.dart';

Widget dropDownSkeleton() {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(),
            child: SizedBox(
              width: 70,
              height: 70,
            ),
          ),
        );
      });
}
