import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/categories_list_bloc/categories_list_bloc.dart';
import '../../../../repository/get_categories_list.dart';
import '../../../skeletons_loading/drop_down_skeleton.dart';

class DropCategories extends StatefulWidget {
  DropCategories({super.key});

  @override
  State<DropCategories> createState() => _DropCategoriesState();
}

String? dropdownValue;

class _DropCategoriesState extends State<DropCategories> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesListBloc(getCategoriesRepository: GetCategoriesRepository())
            ..add(CategoriesEvent()),
      child: BlocBuilder<CategoriesListBloc, CategoriesListState>(
          builder: ((context, state) {
        if (state.loadingStatus == CategoriesStatus.loading) {
          return dropDownSkeleton();
        } else if (state.loadingStatus == CategoriesStatus.loaded) {
          return DropdownButtonFormField(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: state.data.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value['_id'],
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(value['name'])),
                );
              }).toList());
        } else {
          return Text('error');
        }
      })),
    );
  }
}
