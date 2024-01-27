import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/cart_screen/custom%20widget/product_and_price.dart';
import '../../../../models/Product.dart';
import '../../../custom_widgets/main_btn.dart';

Future<dynamic> totalPriceCard(BuildContext context, List<Product> products) {
  double totalPrice = 0.0;

  for (var item in products) {
    totalPrice += double.parse(item.price.toString());
  }

  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Total Order',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/icons/visa.png',
                        width: 100,
                        height: 80,
                      )
                    ],
                  ),
                  const SizedBox(height: 14),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return productAndPrice(products[index].title.toString(),
                            products[index].price.toString());
                      }),
                  const Divider(),
                  Row(
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        totalPrice != null ? totalPrice.toString() : '0',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  mainBtn(context)
                ],
              ),
            ),
          ],
        );
      });
}
//49