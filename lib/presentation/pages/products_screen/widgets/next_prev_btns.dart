import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_products_bloc/get_product_bloc.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/disabled_btn.dart';

Widget nextPrev(BuildContext context, String id) {
  int pagek = 1;
  increamet() {
    return pagek++;
  }

  decrement() {
    return pagek - 1;
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      int.parse(context
                  .read<GetProductBloc>()
                  .state
                  .productModel
                  .page
                  .toString()) ==
              int.parse(context
                  .read<GetProductBloc>()
                  .state
                  .productModel
                  .pagesPerCategory
                  .toString())
          ? disabledBtn("Next", false)
          : InkWell(
              onTap: () {
                increamet();

                context
                    .read<GetProductBloc>()
                    .add(GetProductsEvent(pageNumber: pagek, category: id));
              },
              child: customButton('Next', false),
            ),
      int.parse(context
                  .read<GetProductBloc>()
                  .state
                  .productModel
                  .page
                  .toString()) <=
              1
          ? disabledBtn("Prev", true)
          : InkWell(
              onTap: () {
                decrement();

                context
                    .read<GetProductBloc>()
                    .add(GetProductsEvent(pageNumber: pagek, category: id));
              },
              child: customButton("Prev", true),
            ),
    ],
  );
}
//67