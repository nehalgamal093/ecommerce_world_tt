import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/cart_screen/custom%20widget/product_and_price.dart';

import '../../../custom_widgets/main_btn.dart';

Future<dynamic> totalPriceCard(BuildContext context) {
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
                  productAndPrice('Samsung Galaxy Z', '100'),
                  const SizedBox(height: 10),
                  productAndPrice('Samsung Galaxy Z', '100'),
                  const SizedBox(height: 10),
                  productAndPrice('Samsung Galaxy Z', '100'),
                  const SizedBox(height: 10),
                  productAndPrice('Samsung Galaxy Z', '100'),
                  const Divider(),
                  const Row(
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '400',
                        style: TextStyle(
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