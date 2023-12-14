import 'package:flutter/material.dart';
import '../../../resources/images_manager.dart';

Widget errorLoading() {
  return SizedBox(
    width: 100,
    height: 100,
    child: Image.asset(ImagesManager.errorImg),
  );
}
