import 'package:flutter/material.dart';

import '../../custom_widgets/top_bar.dart';
import 'custom widget/cart_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: topBar('My Cart', true, context),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              children: const [CartTile(), CartTile(), CartTile()],
            ),
          )),
    );
  }
}
