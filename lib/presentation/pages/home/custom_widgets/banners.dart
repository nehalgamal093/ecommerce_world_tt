import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/custom_banner.dart';

Widget banners(BuildContext context) {
  return SizedBox(
    height: 200.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        customBanner(
            context, 'assets/images/bannerthree.jpg', 'Watches', '18 Brand'),
        customBanner(
            context, 'assets/images/bannerone.jpg', 'Fashion', '18 Brand'),
        customBanner(
            context, 'assets/images/bannertwo.jpg', 'Watches', '18 Brand'),
      ],
    ),
  );
}
