// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:world_commerce/bloc/get_cart_list/get_cart_list_bloc.dart';
import 'package:world_commerce/presentation/pages/cart_screen/sections/total_price_cart.dart';
import 'package:world_commerce/presentation/pages/error_screen/error_screen.dart';
import 'package:world_commerce/presentation/pages/product_details/product_details.dart';

import '../../../Services/get_cart_list.dart';
import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../generated/l10n.dart';
import '../../../models/Product.dart';
import '../../custom_widgets/top_bar.dart';
import 'custom widget/cart_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              GetCartListBloc(getCartList: GetCartList(loginBloc))
                ..add(CartEvent()),
          child: BlocBuilder<GetCartListBloc, GetCartListState>(
              builder: (context, state) {
            if (state.loadingStatus == ProductsStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.loadingStatus == ProductsStatus.loaded) {
              int cartItemsListCount =
                  state.cartResponseModel.cartModel.products.length;
              return cartItemsListCount == 0
                  ? const Center(child: Text('No Items in Cart'))
                  : CartListScreen(
                      itemsCount: cartItemsListCount,
                      productsCart: state.cartResponseModel.cartModel.products);
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
        appBar: topBar(S.of(context).myCart, true, context, false),
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
        bottomNavigationBar: itemsCount == 0
            ? Container()
            : InkWell(
                onTap: () {
                  totalPriceCard(context, productsCart);
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
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
  }
}
//118