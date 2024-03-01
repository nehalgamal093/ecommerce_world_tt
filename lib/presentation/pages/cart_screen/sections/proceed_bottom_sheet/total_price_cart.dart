import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/cart_screen/sections/proceed_bottom_sheet/widgets/products_list.dart';
import 'package:world_commerce/presentation/pages/cart_screen/sections/proceed_bottom_sheet/widgets/sheet_header.dart';
import 'package:world_commerce/presentation/pages/cart_screen/sections/proceed_bottom_sheet/widgets/total_price.dart';
import '../../../../../models/product_model.dart';
import '../../../../custom_widgets/main_btn.dart';

Future<dynamic> totalPriceCard(BuildContext context, List<Product?> products) {
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
                  sheetHeader(),
                  const SizedBox(height: 14),
                  productsList(products),
                  const Divider(),
                  totalPriceWidget(products),
                  const SizedBox(height: 50),
                  mainBtn(context)
                ],
              ),
            ),
          ],
        );
      });
}
//33 ✅