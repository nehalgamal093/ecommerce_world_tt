// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/presentation/pages/home/custom_widgets/nav_to_products.dart';
import 'sections/banners.dart';
import 'sections/categories_list.dart';
import 'sections/home_banner.dart';
import 'sections/product_list_home.dart';
import 'sections/searchBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(12),
            child: Column(children: [
              searchBar(context),
              const SizedBox(height: 20),
              homeBanner(context),
              const SizedBox(
                height: 20,
              ),
              categoriesList(context),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    'Special for you',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              banners(context),
              const SizedBox(
                height: 20,
              ),
              // navToProducts(context),
              productListHome(false)
            ]),
          ),
        ),
      ),
    );
  }
}
