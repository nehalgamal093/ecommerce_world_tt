import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/skeletons_loading/skeleton.dart';

Widget horizontalSkeleton() {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return skeleton();
      });
}
