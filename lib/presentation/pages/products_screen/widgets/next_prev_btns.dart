import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_products_bloc/get_product_bloc.dart';
import '../../../../Services/get_products.dart';

import '../../../../bloc/change_page/increase_page_bloc.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/disabled_btn.dart';

Widget nextAndPrevBtn(BuildContext context, String id) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      context.read<IncreasePageBloc>().state.pageNumber <= 1
          ? disabledBtn('Prev', false)
          : InkWell(
              onTap: () {
                context.read<IncreasePageBloc>().add(DecrementEvent());
              },
              child: customButton('Prev', false),
            ),
      BlocProvider(
        create: (context) => GetProductBloc(
          getProducts: GetProducts(),
          changePageBloc: context.read<IncreasePageBloc>(),
        )..add(
            GetProductsEvent(
                pageNumber: context.read<IncreasePageBloc>().state.pageNumber,
                category: id),
          ),
        child: BlocBuilder<GetProductBloc, GetProductState>(
          builder: (context, state) {
            if (state.loadingStatus == ProductsStatus.loading) {
              return customButton('Next', true);
            } else if (state.loadingStatus == ProductsStatus.loaded) {
              return context.read<IncreasePageBloc>().state.pageNumber >=
                      context
                          .read<GetProductBloc>()
                          .state
                          .productModel
                          .totalPages!
                  ? disabledBtn('Next', true)
                  : InkWell(
                      onTap: () {
                        context.read<IncreasePageBloc>().add(IncrementEvent());
                      },
                      child: customButton('Next', true),
                    );
            } else {
              return Container();
            }
          },
        ),
      ),
    ],
  );
}
