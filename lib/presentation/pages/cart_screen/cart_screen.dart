import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_cart_list/get_cart_list_bloc.dart';
import 'package:world_commerce/presentation/pages/error_screen/error_screen.dart';

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
        appBar: topBar('My Cart', true, context, false),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: BlocProvider(
            create: (context) =>
                GetCartListBloc(getCartList: GetCartList())..add(CartEvent()),
            child: BlocBuilder<GetCartListBloc, GetCartListState>(
                builder: (context, state) {
              if (state.loadingStatus == ProductsStatus.loading) {
                return CircularProgressIndicator();
              } else if (state.loadingStatus == ProductsStatus.loaded) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.productCartModel.products!.length,
                    itemBuilder: (context, index) {
                      return CartTile(
                        title: state.productCartModel.products![index].title
                            .toString(),
                        price: state.productCartModel.products![index].price
                            .toString(),
                        image:
                            state.productCartModel.products![index].images![0],
                      );
                    });
              } else {
                return const ErrorScreen();
              }
            }),
          ),
        ),
      ),
    );
  }
}
