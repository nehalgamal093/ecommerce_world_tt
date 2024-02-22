import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/get_cart_list/get_cart_list_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../cart_screen/cart_screen.dart';

Widget searchBar(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .9,
    height: 70,
    child: Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: ColorManager.grey,
              ),
              hintText: S.of(context).searchProduct,
              hintStyle: const TextStyle(color: ColorManager.grey),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        //error here
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
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
                      child: Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    ),
                    Positioned(
                      top: 1,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.pink,
                        child: Text(
                          state.productCartModel.products!.length.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Container();
                // return const ErrorScreen();
              }
            }),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: 20,
            child: Icon(Icons.notifications_outlined),
          ),
        )
      ],
    ),
  );
}
//92