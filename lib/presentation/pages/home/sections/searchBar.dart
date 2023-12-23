import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Services/get_cart_list.dart';
import '../../../../bloc/get_cart_list/get_cart_list_bloc.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../cart_screen/cart_screen.dart';
import '../../error_screen/error_screen.dart';

Widget searchBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * .7,
        child: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: ColorManager.grey,
            ),
            hintText: StringsManager.searchProduct,
            hintStyle: TextStyle(color: ColorManager.grey),
            filled: true,
            fillColor: ColorManager.lightGrey,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen()));
        },
        child: BlocProvider(
          create: (context) =>
              GetCartListBloc(getCartList: GetCartList())..add(CartEvent()),
          child: BlocBuilder<GetCartListBloc, GetCartListState>(
              builder: (context, state) {
            if (state.loadingStatus == ProductsStatus.loading) {
              return const CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 244, 229, 247),
              );
            } else if (state.loadingStatus == ProductsStatus.loaded) {
              return Stack(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorManager.lightGrey,
                    child: Icon(Icons.shopping_cart_outlined,
                        color: ColorManager.grey),
                  ),
                  Positioned(
                    right: 1,
                    top: 1,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.pink,
                      child: Text(
                        state.productCartModel.products!.length.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const ErrorScreen();
            }
          }),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      const CircleAvatar(
        backgroundColor: ColorManager.lightGrey,
        child: Icon(Icons.notifications_outlined, color: ColorManager.grey),
      )
    ],
  );
}
