import 'package:flutter/material.dart';

import '../../../../models/Product.dart';
import '../../custom_product/custom_product.dart';
import '../../product_details/product_details.dart';

Widget horizontalList(List<Product>? dataFromApi) {
  return SizedBox(
    height: 300,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: dataFromApi!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    title: dataFromApi[index].title ?? '',
                    price: dataFromApi[index].price.toString(),
                    image: dataFromApi[index].images![0],
                    description: dataFromApi[index].description!,
                    id: dataFromApi[index].id.toString(),
                  ),
                ),
              );
            },
            child: CustomProduct(
                id: dataFromApi[index].id ?? '',
                title: dataFromApi[index].title ?? '',
                imgCover: dataFromApi[index].images![0],
                price: dataFromApi[index].price.toString(),
                ratingAvg: dataFromApi[index].ratingAvg.toString()),
          );
        }),
  );
}
