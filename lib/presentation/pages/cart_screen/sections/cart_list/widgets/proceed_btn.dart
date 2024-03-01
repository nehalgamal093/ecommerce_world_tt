import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../models/product_model.dart';
import '../../proceed_bottom_sheet/total_price_cart.dart';

Widget proceedBtn(
    BuildContext context, int itemsCount, List<Product?> products) {
  return itemsCount == 0
      ? Container()
      : InkWell(
          onTap: () {
            totalPriceCard(context, products);
          },
          child: SizedBox(
            width: 200,
            height: 70,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              child: BottomAppBar(
                color: Colors.pink,
                child: Center(
                  child: Text(
                    S.of(context).proceed,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        );
}
//35✅