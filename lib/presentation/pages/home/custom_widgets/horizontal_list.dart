import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Services/get_products.dart';
import '../../../../bloc/change_page/increase_page_bloc.dart';
import '../../../../bloc/get_products_bloc/get_product_bloc.dart';
import '../../../../models/Product.dart';
import '../../../skeletons_loading/horizontal_skeleton.dart';
import '../../custom_product/custom_product.dart';
import '../../product_details/product_details.dart';

Widget horizontalList(bool isError) {
  return BlocProvider(
    create: (context) => GetProductBloc(
      getProducts: GetProducts(),
      changePageBloc: context.read<IncreasePageBloc>(),
    )..add(
        GetProductsEvent(
            pageNumber: context.read<IncreasePageBloc>().state.pageNumber,
            category: '6512f4557452b0f914b19229'),
      ),
    child: BlocBuilder<GetProductBloc, GetProductState>(
      builder: (context, state) {
        List<Product>? dataFromApi = state.productModel.products;
        if (state.loadingStatus == ProductsStatus.loading) {
          return SizedBox(height: 300, child: horizontalSkeleton());
        } else if (state.loadingStatus == ProductsStatus.loaded) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: dataFromApi!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            title: dataFromApi[index].title ?? '',
                            price: dataFromApi[index].price.toString(),
                            image: dataFromApi[index].images![0],
                            description: dataFromApi[index].description!,
                            id: dataFromApi[index].id.toString(),
                          ),
                        ),
                      );
                    },
                    child: CustomProduct(
                        title: dataFromApi[index].title ?? '',
                        imgCover: dataFromApi[index].images![0],
                        price: dataFromApi[index].price.toString(),
                        ratingAvg: dataFromApi[index].ratingAvg.toString()),
                  );
                }),
          );
        } else {
          return SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('assets/images/error.png'));
        }
      },
    ),
  );
}
