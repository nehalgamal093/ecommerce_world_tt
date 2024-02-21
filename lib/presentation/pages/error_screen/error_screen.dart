import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_products_bloc/get_product_bloc.dart';

import '../../../bloc/change_page/increase_page_bloc.dart';
import '../../custom_widgets/btn.dart';
import '../../resources/assets_manager.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(AssetsManager.robot),
            ),
            const SizedBox(height: 40),
            const Text(
              'Opssssssssss',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Something went wrong',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 40),
            InkWell(
                onTap: () {
                  context.read<GetProductBloc>().add(
                        GetProductsEvent(
                          pageNumber:
                              context.read<IncreasePageBloc>().state.pageNumber,
                          category: '6512f4557452b0f914b19229',
                        ),
                      );
                },
                child: btn('Try Again'))
          ],
        ),
      ),
    );
  }
}
