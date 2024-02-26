import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/brands_list_bloc/brands_list_bloc.dart';
import '../../../../repository/get_brands_list.dart';
import '../../../skeletons_loading/drop_down_skeleton.dart';

class DropBrands extends StatefulWidget {
  const DropBrands({super.key});

  @override
  State<DropBrands> createState() => _DropBrandsState();
}

String? brandsDropDown;

class _DropBrandsState extends State<DropBrands> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BrandsListBloc(getBrandsRepository: GetBrandsRepository())
            ..add(BrandsEvent()),
      child: BlocBuilder<BrandsListBloc, BrandsListState>(
          builder: ((context, state) {
        if (state.loadingStatus == BrandsStatus.loading) {
          return dropDownSkeleton();
        } else if (state.loadingStatus == BrandsStatus.loaded) {
          return Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color.fromARGB(255, 43, 35, 63),
            ),
            child: DropdownButtonFormField(
                value: brandsDropDown,
                onChanged: (String? newValue) {
                  setState(() {
                    brandsDropDown = newValue!;
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
