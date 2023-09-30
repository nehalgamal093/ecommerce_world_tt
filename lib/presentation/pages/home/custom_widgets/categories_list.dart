import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/presentation/pages/products_screen/products_screen.dart';

import '../../../../bloc/categories_list_bloc/categories_list_bloc.dart';
import '../../../../repository/get_categories_list.dart';
import '../../../skeletons_loading/drop_down_skeleton.dart';

final List<Categories> list = [
  Categories(title: 'Electronics', icon: Icons.tv_outlined),
  Categories(title: 'Fashion', icon: Icons.ad_units),
  Categories(title: 'Home', icon: Icons.home),
  Categories(title: 'Books', icon: Icons.book),
  Categories(title: 'Beauty', icon: Icons.beach_access),
  Categories(title: 'Electronics', icon: Icons.tv_outlined),
];

class Categories {
  String title;
  IconData icon;
  Categories({
    required this.title,
    required this.icon,
  });
}

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductsScreen(id: state.data[index]['_id'])));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                          child: const Icon(
                            Icons.tv_outlined,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Text(
                        state.data[index]['name'],
                        style: const TextStyle(
                          fontSize: 10,
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
