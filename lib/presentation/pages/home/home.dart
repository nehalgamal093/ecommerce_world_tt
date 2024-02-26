// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/login_bloc/login_bloc.dart';
import 'package:world_commerce/generated/l10n.dart';
import 'package:world_commerce/repository/login_repo.dart';
import '../../../Services/get_user.dart';
import '../../../bloc/get_user_bloc/get_user_bloc.dart';
import 'sections/banners.dart';
import 'sections/categories_list.dart';
import 'sections/home_banner.dart';
import 'sections/product_list_home.dart';
import 'sections/searchBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              GetUserBloc(getUser: GetUser(loginBloc))..add(GetUserDataEvent()),
          child: BlocBuilder<GetUserBloc, GetUserState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Column(children: [
                      searchBar(context, state.data.role),
                      const SizedBox(height: 20),
                      homeBanner(context),
                      const SizedBox(
                        height: 20,
                      ),
                      categoriesList(context),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            S.of(context).specialForYou,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
