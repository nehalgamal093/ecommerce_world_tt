import 'package:flutter/material.dart';
import '../../../../product_details/product_details.dart';
import '../../cart_tile/cart_tile.dart';

Widget navigateToProductDetailsBtn(BuildContext context, String image,
    String title, String description, String price, String id) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetails(
              image: image,
              title: title,
              description: description,
              price: price,
              id: id),
        ),
      );
    },
    child: CartTile(
      title: title,
      price: price,
      image: image,
    ),
  );
}
