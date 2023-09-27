import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/skeletons_loading/skeleton.dart';

Widget gridSkeleton() {
  return GridView(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 16.0,
      childAspectRatio: 635 / 889,
    ),
    children: List.generate(6, (index) => skeleton()),
  );
}
