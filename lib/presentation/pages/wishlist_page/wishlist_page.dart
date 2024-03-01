import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_wishlist_bloc/get_wishlist_bloc.dart';
import 'package:world_commerce/presentation/pages/wishlist_page/custom_widgets/wishlist_tile.dart';
import 'package:world_commerce/repository/get_wishlist.dart';
import '../../../bloc/login_bloc/login_bloc.dart';
import '../../../models/Product.dart';
import '../error_screen/error_screen.dart';
import '../product_details/product_details.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            GetWishlistBloc(getWishList: GetWishList(loginBloc))
              ..add(WishListEvent()),
        child: BlocBuilder<GetWishlistBloc, GetWishlistState>(
            builder: (context, state) {
          if (state.wishListStatus == WishListStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.wishListStatus == WishListStatus.loaded) {
            return WishList(
                itemsCount: state.wishListModel.likedProducts.length,
                wishlist: state.wishListModel.likedProducts);
          } else {
            return const ErrorScreen();
          }
        }),
      ),
    );
  }
}

class WishList extends StatelessWidget {
  final int itemsCount;
  final List<Product> wishlist;
  const WishList({Key? key, required this.itemsCount, required this.wishlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              image: wishlist[index].images![0],
                              title: wishlist[index].title.toString(),
                              description:
                                  wishlist[index].description.toString(),
                              price: wishlist[index].price.toString(),
                              id: wishlist[index].id.toString())));
                },
                child: WishListTile(
                  title: wishlist[index].title.toString(),
                  price: wishlist[index].price.toString(),
                  image: wishlist[index].images![0],
                ),
              );
            }),
      ),
    );
  }
}
