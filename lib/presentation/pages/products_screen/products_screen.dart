import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/presentation/custom_widgets/top_bar.dart';
import 'package:world_commerce/presentation/pages/custom_product/custom_product.dart';
import 'package:world_commerce/presentation/pages/product_details/product_details.dart';
import 'package:world_commerce/presentation/pages/products_screen/widgets/next_prev_btns.dart';
import '../../../Services/get_products.dart';
import '../../../bloc/change_page/increase_page_bloc.dart';
import '../../../bloc/get_products_bloc/get_product_bloc.dart';
import '../../../models/Product.dart';
import '../../skeletons_loading/grid_skeleton.dart';
import '../error_screen/error_screen.dart';

class ProductsScreen extends StatelessWidget {
  final String id;
  const ProductsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: topBar('Our Products', true, context, false),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .87,
              child: BlocProvider(
                create: (context) => GetProductBloc(
                  getProducts: GetProducts(),
                  // changePageBloc: context.read<IncreasePageBloc>(),
                )..add(
                    GetProductsEvent(
                        pageNumber:
                            context.read<IncreasePageBloc>().state.pageNumber,
                        category: id),
                  ),
                child: BlocBuilder<GetProductBloc, GetProductState>(
                  builder: (context, state) {
                    List<Product> dataFromApi = state.productModel.products!;

                    if (state.loadingStatus == ProductsStatus.loading) {
                      return gridSkeleton();
                    } else if (state.loadingStatus == ProductsStatus.loaded) {
                      return CustomScrollView(
                        semanticChildCount: 2,
                        slivers: [
                          SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2.0,
                              crossAxisSpacing: 16.0,
                              childAspectRatio: 635 / 889,
                            ),
                            delegate: SliverChildListDelegate(
                              List.generate(dataFromApi.length, (index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                            image:
                                                dataFromApi[index].images![0],
                                            title: dataFromApi[index].title!,
                                            description:
                                                dataFromApi[index].description!,
                                            price: dataFromApi[index]
                                                .price
                                                .toString(),
                                            id: dataFromApi[index]
                                                .id
                                                .toString()),
                                      ),
                                    );
                                  },
                                  child: CustomProduct(
                                    title: dataFromApi[index].title!,
                                    imgCover: dataFromApi[index].images![0],
                                    price: dataFromApi[index].price.toString(),
                                    ratingAvg:
                                        dataFromApi[index].ratingAvg.toString(),
                                  ),
                                );
                              }),
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildListDelegate([
                              Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: NextAndPrevBtn(id: id),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              )
                            ]),
                          ),
                        ],
                      );
                    } else {
                      return const ErrorScreen();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
