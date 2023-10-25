import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_products_bloc/get_product_bloc.dart';
import '../../../../Services/get_products.dart';

import '../../../../bloc/change_page/increase_page_bloc.dart';
import '../../../custom_widgets/custom_button.dart';
import '../../../custom_widgets/disabled_btn.dart';

// Widget nextAndPrevBtn(BuildContext context, String id) {
//   int pagek = 1;
//   increment() {
//     pagek++;
//   }

//   print('======Outside $pagek');
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     crossAxisAlignment: CrossAxisAlignment.end,
//     children: [
//       context.read<IncreasePageBloc>().state.pageNumber <= 1
//           ? disabledBtn(
//               context
//                   .watch<GetProductBloc>()
//                   .state
//                   .productModel
//                   .pagesPerCategory!
//                   .toString(),
//               false)
//           : InkWell(
//               onTap: () {
//                 context.read<IncreasePageBloc>().add(DecrementEvent());
//               },
//               child: customButton(
//                   context
//                       .watch<GetProductBloc>()
//                       .state
//                       .productModel
//                       .pagesPerCategory!
//                       .toString(),
//                   false),
//             ),
//       pagek >=
//               context
//                   .read<GetProductBloc>()
//                   .state
//                   .productModel
//                   .pagesPerCategory!
//           ? disabledBtn(
//               context
//                   .watch<GetProductBloc>()
//                   .state
//                   .productModel
//                   .pagesPerCategory!
//                   .toString(),
//               true)
//           : InkWell(
//               onTap: () async {
//                 print(
//                     '===pagePerCategory ${context.read<GetProductBloc>().state.productModel.pagesPerCategory!}');
//                 // context.read<IncreasePageBloc>().add(IncrementEvent());
//                 // int number = context.read<IncreasePageBloc>().state.pageNumber;
//                 increment();
//                 print('===pageNumber ${pagek}');
//                 if (pagek > 1) {
//                   context.read<GetProductBloc>().add(
//                         GetProductsEvent(pageNumber: pagek, category: id),
//                       );
//                 }
//               },
//               child: customButton(
//                   context
//                       .watch<GetProductBloc>()
//                       .state
//                       .productModel
//                       .pagesPerCategory!
//                       .toString(),
//                   true),
//             )
//     ],
//   );
// }
class NextAndPrevBtn extends StatefulWidget {
  final String id;
  const NextAndPrevBtn({super.key, required this.id});

  @override
  State<NextAndPrevBtn> createState() => _NextAndPrevBtnState();
}

class _NextAndPrevBtnState extends State<NextAndPrevBtn> {
  @override
  Widget build(BuildContext context) {
    int pagek = 1;
    increment() {
      pagek++;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        context.read<IncreasePageBloc>().state.pageNumber <= 1
            ? disabledBtn(
                context
                    .watch<GetProductBloc>()
                    .state
                    .productModel
                    .pagesPerCategory!
                    .toString(),
                false)
            : InkWell(
                onTap: () {
                  context.read<IncreasePageBloc>().add(DecrementEvent());
                },
                child: customButton(
                    context
                        .watch<GetProductBloc>()
                        .state
                        .productModel
                        .pagesPerCategory!
                        .toString(),
                    false),
              ),
        pagek >=
                context
                    .read<GetProductBloc>()
                    .state
                    .productModel
                    .pagesPerCategory!
            ? disabledBtn(
                context
                    .watch<GetProductBloc>()
                    .state
                    .productModel
                    .pagesPerCategory!
                    .toString(),
                true)
            : InkWell(
                onTap: () async {
                  print(
                      '===pagePerCategory ${context.read<GetProductBloc>().state.productModel.pagesPerCategory!}');
                  // context.read<IncreasePageBloc>().add(IncrementEvent());
                  // int number = context.read<IncreasePageBloc>().state.pageNumber;
                  increment();
                  print('===pageNumber ${pagek}');
                  if (pagek > 1) {
                    context.read<GetProductBloc>().add(
                          GetProductsEvent(
                              pageNumber: pagek, category: widget.id),
                        );
                  }
                },
                child: customButton(
                    context
                        .watch<GetProductBloc>()
                        .state
                        .productModel
                        .pagesPerCategory!
                        .toString(),
                    true),
              )
      ],
    );
  }
}
