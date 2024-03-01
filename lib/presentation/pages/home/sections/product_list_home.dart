import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/presentation/pages/home/custom_widgets/error.dart';
import 'package:world_commerce/presentation/pages/home/custom_widgets/horizontal_list.dart';
import '../../../../Services/get_products.dart';
import '../../../../bloc/get_products_bloc/get_product_bloc.dart';
import '../../../../models/Product.dart';
import '../../../skeletons_loading/horizontal_skeleton.dart';

Widget productListHome(bool isError) {
  return BlocProvider(
    create: (context) => GetProductBloc(
      getProducts: GetProducts(),
    )..add(
        const GetProductsEvent(
            pageNumber: 1, category: '6512f4557452b0f914b19229'),
      ),
    child: BlocBuilder<GetProductBloc, GetProductState>(
      builder: (context, state) {
        List<Product>? dataFromApi = state.productModel.products;

        if (state.loadingStatus == ProductStatus.loading) {
          return SizedBox(height: 300, child: horizontalSkeleton());
        } else if (state.loadingStatus == ProductStatus.loaded) {
          return horizontalList(dataFromApi);
        } else if (state.loadingStatus == ProductStatus.error) {
          return errorLoading();
        } else {
          return Container();
        }
      },
    ),
  );
}
