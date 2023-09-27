import 'package:flutter/material.dart';

Widget homeBanner(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/ppl.png'), fit: BoxFit.cover),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
  );
}
