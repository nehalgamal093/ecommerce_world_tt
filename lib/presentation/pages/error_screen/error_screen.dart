import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_products_bloc/get_product_bloc.dart';

import '../../custom_widgets/btn.dart';

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
              child: Image.asset('assets/images/robot.png'),
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
                            pageNumber: 1,
                            category: '65154a10445160954746cfc9'),
                      );
                },
                child: btn('Try Again'))
          ],
        ),
      ),
    );
  }
}
