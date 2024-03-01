import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/add_product_to_wishlist_bloc/add_product_to_wishlist_bloc.dart';

Widget unlikedBtn(BuildContext context, String id) {
  return IconButton(
    onPressed: () {
      context.read<AddProductToWishlistBloc>().add(LikeProduct(id: id));
    },
    icon: const Icon(
      Icons.favorite_border_outlined,
      color: Colors.grey,
    ),
  );
}
//17✅