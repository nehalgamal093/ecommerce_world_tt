// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_cart_list/get_cart_list_bloc.dart';
import 'package:world_commerce/presentation/pages/error_screen/error_screen.dart';
import '../../../../Services/get_cart_list.dart';
import '../../../../bloc/login_bloc/login_bloc.dart';
import '../sections/cart_list/cart_list.dart';

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
              int? cartItemsListCount =
                  state.cartResponseModel.cartModel?.products.length;
              return cartItemsListCount == 0
                  ? const Center(child: Text('No Items in Cart'))
                  : CartListScreen(
                      itemsCount: cartItemsListCount!,
                      productsCart:
                          state.cartResponseModel.cartModel!.products);
            } else {
              return const ErrorScreen();
            }
          }),
        ),
      ),
    );
  }
}
//44 ✅