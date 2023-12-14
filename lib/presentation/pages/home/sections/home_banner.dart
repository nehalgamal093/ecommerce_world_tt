import 'package:flutter/material.dart';

import '../../../resources/images_manager.dart';

Widget homeBanner(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(ImagesManager.pplImg), fit: BoxFit.cover),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
  );
}
