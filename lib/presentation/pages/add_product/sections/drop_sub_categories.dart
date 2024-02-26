import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/sub_categories_list_bloc/sub_categories_list_bloc.dart';
import '../../../../repository/get_subCategories_list.dart';
import '../../../skeletons_loading/drop_down_skeleton.dart';

class DropSubCategories extends StatefulWidget {
  const DropSubCategories({super.key});

  @override
  State<DropSubCategories> createState() => _DropSubCategoriesState();
}

String? subCategoryDropDown;

class _DropSubCategoriesState extends State<DropSubCategories> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubCategoriesListBloc(
          subCategoriesRepository: GetSubCategoriesRepository())
        ..add(SubCategoriesEvent()),
      child: BlocBuilder<SubCategoriesListBloc, SubCategoriesListState>(
          builder: ((context, state) {
        if (state.loadingStatus == SubCategoriesStatus.loading) {
          return dropDownSkeleton();
        } else if (state.loadingStatus == SubCategoriesStatus.loaded) {
          return Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color.fromARGB(255, 43, 35, 63),
            ),
            child: DropdownButtonFormField(
                value: subCategoryDropDown,
                onChanged: (String? newValue) {
                  setState(() {
                    subCategoryDropDown = newValue!;
                  });
                },
                items: state.data.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value['_id'],
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          value['name'],
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                  );
                }).toList()),
          );
        } else {
          return const Text('error');
        }
      })),
    );
  }
}
