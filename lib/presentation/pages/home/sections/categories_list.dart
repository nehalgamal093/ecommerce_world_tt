import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/presentation/pages/products_screen/products_screen.dart';

import '../../../../bloc/categories_list_bloc/categories_list_bloc.dart';
import '../../../../bloc/change_page/increase_page_bloc.dart';
import '../../../../bloc/get_products_bloc/get_product_bloc.dart';
import '../../../../repository/get_categories_list.dart';
import '../../../skeletons_loading/drop_down_skeleton.dart';

Widget categoriesList(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 100,
    child: BlocProvider(
      create: (context) =>
          CategoriesListBloc(getCategoriesRepository: GetCategoriesRepository())
            ..add(CategoriesEvent()),
      child: BlocBuilder<CategoriesListBloc, CategoriesListState>(
          builder: ((context, state) {
        if (state.loadingStatus == CategoriesStatus.loading) {
          return dropDownSkeleton();
        } else if (state.loadingStatus == CategoriesStatus.loaded) {
          return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductsScreen(id: state.data[index]['_id'])));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 3),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            // color: ColorManager.lightOrange,
                            border: Border.all(color: Colors.purple),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Icon(
                            iconCategory(state.data[index]['name']),
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Text(
                        state.data[index]['name'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 199, 163, 205),
                        ),
                      )
                    ],
                  ),
                );
              });
        } else {
          return Text('error');
        }
      })),
    ),
  );
}

IconData iconCategory(String category) {
  switch (category) {
    case "Fashion":
      return Icons.shopping_basket_outlined;
    case "Electronics":
      return Icons.tv_outlined;
    case "Gaming":
      return Icons.gamepad_outlined;
    case "Home":
      return Icons.home_outlined;
    case "Pets":
      return Icons.pets;
    default:
      return Icons.account_balance_wallet;
  }
}
