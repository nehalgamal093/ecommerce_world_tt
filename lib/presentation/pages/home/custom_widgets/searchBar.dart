import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../cart_screen/cart_screen.dart';

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
            hintText: 'Search Product',
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
        child: const CircleAvatar(
          backgroundColor: ColorManager.lightGrey,
          child: Icon(Icons.shopping_cart_outlined, color: ColorManager.grey),
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
