import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/cart_screen/sections/cart_list/widgets/list_of_products_in_cart.dart';
import 'package:world_commerce/presentation/pages/cart_screen/sections/cart_list/widgets/proceed_btn.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../models/product_model.dart';
import '../../../../custom_widgets/top_bar.dart';

class CartListScreen extends StatelessWidget {
  final int itemsCount;
  final List<Product?> productsCart;
  const CartListScreen(
      {Key? key, required this.itemsCount, required this.productsCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(S.of(context).myCart, true, context, false),
      body: listOfProductsInCart(itemsCount, productsCart),
      bottomNavigationBar: proceedBtn(context, itemsCount, productsCart),
    );
  }
}
//24✅