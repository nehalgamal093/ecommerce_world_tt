import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/custom_banner.dart';
import '../../../resources/images_manager.dart';
import '../../../resources/strings_manager.dart';

Widget banners(BuildContext context) {
  return SizedBox(
    height: 200.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        customBanner(context, ImagesManager.bannerThree, StringsManager.watches,
            StringsManager.brands),
        customBanner(context, ImagesManager.bannerOne, StringsManager.fashion,
            StringsManager.brands),
        customBanner(context, ImagesManager.bannerTwo, StringsManager.watches,
            StringsManager.brands),
      ],
    ),
  );
}
