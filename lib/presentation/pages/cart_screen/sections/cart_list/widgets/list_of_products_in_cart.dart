import 'package:flutter/material.dart';
import '../../../../../../models/product_model.dart';
import 'navigate_to_product_details_btn.dart';

Widget listOfProductsInCart(int itemsCount, List<Product?> products) {
  return Container(
    padding: const EdgeInsets.all(5),
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemsCount,
        itemBuilder: (context, index) {
          Product productInCart = products[index]!;
          return navigateToProductDetailsBtn(
              context,
              productInCart.images![0],
              productInCart.title.toString(),
              productInCart.description.toString(),
              productInCart.price.toString(),
              productInCart.id.toString());
        }),
  );
}
//23 ✅