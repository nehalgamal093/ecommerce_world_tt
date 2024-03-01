import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/custom_product/widgets/button_widget.dart';
import 'package:world_commerce/presentation/pages/custom_product/widgets/product_picture.dart';
import 'package:world_commerce/presentation/pages/custom_product/widgets/product_price.dart';
import 'package:world_commerce/presentation/pages/custom_product/widgets/product_rating.dart';
import 'package:world_commerce/presentation/pages/custom_product/widgets/product_title.dart';

class CustomProduct extends StatefulWidget {
  final String id;
  final String title;
  final String imgCover;
  final String price;
  final String ratingAvg;
  const CustomProduct(
      {super.key,
      required this.id,
      required this.title,
      required this.imgCover,
      required this.price,
      required this.ratingAvg});

  @override
  State<CustomProduct> createState() => _CustomProductState();
}

class _CustomProductState extends State<CustomProduct> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.all(8),
          child: SizedBox(
            width: 230.0,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                productPicture(widget.imgCover),
                const SizedBox(height: 10),
                productTitle(widget.title),
                const SizedBox(height: 5),
                productPrice(widget.price),
                const SizedBox(height: 10),
                productRating(widget.ratingAvg)
              ],
            ),
          ),
        ),
        buttonWidget(context, widget.id)
      ],
    );
  }
}
//55✅