import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/cart_screen/proceed_bottom_sheet/widgets/product_and_price.dart';

import '../../../../../models/product_model.dart';

Widget productsList(List<Product?> products) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return productAndPrice(products[index]!.title.toString(),
            products[index]!.price.toString());
      });
}
//15 ✅