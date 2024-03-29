import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/custom_banner.dart';
import 'package:world_commerce/presentation/resources/assets_manager.dart';
import '../../../../generated/l10n.dart';

Widget banners(BuildContext context) {
  return SizedBox(
    height: 200.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        customBanner(context, AssetsManager.bannerThree, S.of(context).watches,
            S.of(context).brand18),
        customBanner(context, AssetsManager.bannerOne, S.of(context).fashion,
            S.of(context).brand18),
        customBanner(context, AssetsManager.bannerTwo, S.of(context).watches,
            S.of(context).brand18),
      ],
    ),
  );
}
