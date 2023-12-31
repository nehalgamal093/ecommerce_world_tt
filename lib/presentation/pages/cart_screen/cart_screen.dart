// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:world_commerce/bloc/get_cart_list/get_cart_list_bloc.dart';
import 'package:world_commerce/presentation/pages/cart_screen/sections/total_price_cart.dart';
import 'package:world_commerce/presentation/pages/error_screen/error_screen.dart';
import 'package:world_commerce/presentation/pages/product_details/product_details.dart';

import '../../../Services/get_cart_list.dart';
import '../../../models/Product.dart';
import '../../custom_widgets/top_bar.dart';
import 'custom widget/cart_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              GetCartListBloc(getCartList: GetCartList())..add(CartEvent()),
          child: BlocBuilder<GetCartListBloc, GetCartListState>(
              builder: (context, state) {
            if (state.loadingStatus == ProductsStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.loadingStatus == ProductsStatus.loaded) {
              return CartListScreen(
                  itemsCount: state.productCartModel.products!.length,
                  productsCart: state.productCartModel.products!);
            } else {
              return const ErrorScreen();
            }
          }),
        ),
      ),
    );
  }
}

class CartListScreen extends StatelessWidget {
  final int itemsCount;
  final List<Product> productsCart;
  const CartListScreen(
      {Key? key, required this.itemsCount, required this.productsCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar('My Cart', true, context, false),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemsCount,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                              image: productsCart[index].images![0],
                              title: productsCart[index].title.toString(),
                              description:
                                  productsCart[index].description.toString(),
                              price: productsCart[index].price.toString(),
                              id: productsCart[index].id.toString())));
                },
                child: CartTile(
                  title: productsCart[index].title.toString(),
                  price: productsCart[index].price.toString(),
                  image: productsCart[index].images![0],
                ),
              );
            }),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          totalPriceCard(context, productsCart);
        },
        child: Container(
          width: 200,
          height: 70,
          child: const ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
            child: BottomAppBar(
              color: Colors.pink,
              child: Center(
                child: Text(
                  'Proceed',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//89