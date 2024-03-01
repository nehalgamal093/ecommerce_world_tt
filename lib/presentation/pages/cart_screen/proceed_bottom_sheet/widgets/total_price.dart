import 'package:flutter/material.dart';
import '../../../../../models/product_model.dart';

Widget totalPriceWidget(List<Product?> products) {
  double totalPrice = 0.0;

  for (var item in products) {
    totalPrice += item!.price ?? double.parse(item.price.toString());
  }

  return Row(
    children: [
      const Text(
        'Total',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      Text(
        // ignore: unnecessary_null_comparison
        totalPrice != null ? totalPrice.toString() : '0',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )
    ],
  );
}
//26 ✅