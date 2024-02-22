import 'package:flutter/material.dart';

Widget skeleton() {
  return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, snapshot) {
        return const Padding(
          padding: EdgeInsets.all(5.0),
          child: Card(
            shape: RoundedRectangleBorder(),
            child: SizedBox(
              width: 200,
              height: 200,
            ),
          ),
        );
      });
}
