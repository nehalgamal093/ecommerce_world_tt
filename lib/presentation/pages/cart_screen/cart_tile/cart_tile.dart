import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/cart_screen/cart_tile/widgets/increase_and_decrease_quantity.dart';
import 'package:world_commerce/presentation/pages/cart_screen/cart_tile/widgets/product_image.dart';
import 'package:world_commerce/presentation/pages/cart_screen/cart_tile/widgets/product_name.dart';
import 'package:world_commerce/presentation/pages/cart_screen/cart_tile/widgets/product_price.dart';

class CartTile extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  const CartTile(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      child: SizedBox(
        width: width * .90,
        height: 110,
        child: Row(
          children: [
            productImage(image),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                productName(title),
                productPrice(price),
              ],
            ),
            const Spacer(),
            increaseAndDecreaseQuantity(),
          ],
        ),
      ),
    );
  }
}
//45 ✅