import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/custom_product/widgets/liked_btn.dart';
import 'package:world_commerce/presentation/pages/custom_product/widgets/unliked_btn.dart';

import '../../../../models/product_model.dart';

Widget btnIfProductLikedOrNotLiked(
    List<Product?> listOfLikedProducts, BuildContext context, String id) {
  List<String?> list = listOfLikedProducts.map((e) => e?.id).toList();

  return list.contains(id) ? likedBtn(context, id) : unlikedBtn(context, id);
}
