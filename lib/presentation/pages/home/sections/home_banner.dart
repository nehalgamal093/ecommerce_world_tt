import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/resources/assets_manager.dart';

Widget homeBanner(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(AssetsManager.pplImage), fit: BoxFit.cover),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
  );
}
