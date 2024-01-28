import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/resources/assets_manager.dart';

Widget errorLoading() {
  return SizedBox(
    width: 100,
    height: 100,
    child: Image.asset(AssetsManager.error),
  );
}
