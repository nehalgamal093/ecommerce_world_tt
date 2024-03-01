import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/presentation/pages/custom_product/widgets/unliked_btn.dart';
import '../../../../bloc/add_product_to_wishlist_bloc/add_product_to_wishlist_bloc.dart';
import '../../../../bloc/get_wishlist_bloc/get_wishlist_bloc.dart';
import '../../../../bloc/login_bloc/login_bloc.dart';
import '../../../../repository/get_wishlist.dart';
import 'liked_btn.dart';

Widget buttonWidget(BuildContext context, String id) {
  final loginBloc = BlocProvider.of<LoginBloc>(context);
  return Positioned(
    top: 13,
    right: 13,
    child: BlocProvider(
      create: (context) => GetWishlistBloc(getWishList: GetWishList(loginBloc))
        ..add(WishListEvent()),
      child: BlocBuilder<GetWishlistBloc, GetWishlistState>(
        builder: (context, wishlistState) {
          if (wishlistState.wishListStatus == WishListStatus.loading) {
            return Container();
          } else if (wishlistState.wishListStatus == WishListStatus.loaded) {
            return BlocProvider(
              create: (context) => AddProductToWishlistBloc(
                getWishList: GetWishList(loginBloc),
              ),
              child: BlocBuilder<AddProductToWishlistBloc,
                  AddProductToWishlistState>(
                builder: (context, state) {
                  if (state.addToWishlistStatus ==
                      AddToWishlistStatus.loading) {
                    return Container();
                  } else if (state.addToWishlistStatus ==
                      AddToWishlistStatus.initial) {
                    List<String?> list = wishlistState
                        .wishListModel.likedProducts
                        .map((e) => e.id)
                        .toList();

                    return list.contains(id)
                        ? likedBtn(context, id)
                        : unlikedBtn(context, id);
                  } else if (state.addToWishlistStatus ==
                      AddToWishlistStatus.liked) {
                    return likedBtn(context, id);
                  } else if (state.addToWishlistStatus ==
                      AddToWishlistStatus.unliked) {
                    return unlikedBtn(context, id);
                  } else {
                    return Container();
                  }
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    ),
  );
}
//63✅