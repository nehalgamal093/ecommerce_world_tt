import 'package:flutter/material.dart';

import '../../../Services/get_cart_list.dart';
import '../../../models/ProductCartModel.dart';
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
            padding: const EdgeInsets.all(5),
            child: FutureBuilder<ProductCartModel>(
                future: GetCartList().fetchCartList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.products!.length,
                        itemBuilder: (context, index) {
                          return CartTile(
                            title: snapshot.data!.products![index].title
                                .toString(),
                            price: snapshot.data!.products![index].price
                                .toString()
                                .toString(),
                            image: snapshot.data!.products![index].images![0],
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )),
    );
  }
}
