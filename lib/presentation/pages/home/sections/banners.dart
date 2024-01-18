import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/custom_banner.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/images_manager.dart';
import '../../../resources/strings_manager.dart';

Widget banners(BuildContext context) {
  return SizedBox(
    height: 200.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        customBanner(context, ImagesManager.bannerThree, S.of(context).watches,
            S.of(context).brand18),
        customBanner(context, ImagesManager.bannerOne, S.of(context).fashion,
            S.of(context).brand18),
        customBanner(context, ImagesManager.bannerTwo, S.of(context).watches,
            S.of(context).brand18),
      ],
    ),
  );
}
