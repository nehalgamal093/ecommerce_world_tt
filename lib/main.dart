import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/Services/get_user.dart';
import 'package:world_commerce/bloc/add_product_bloc/add_product_bloc.dart';
import 'package:world_commerce/bloc/brands_list_bloc/brands_list_bloc.dart';
import 'package:world_commerce/bloc/categories_list_bloc/categories_list_bloc.dart';
import 'package:world_commerce/bloc/get_products_bloc/get_product_bloc.dart';
import 'package:world_commerce/bloc/get_user_bloc/get_user_bloc.dart';

import 'package:world_commerce/bloc/save_login/save_login_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:world_commerce/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:world_commerce/bloc/sub_categories_list_bloc/sub_categories_list_bloc.dart';

import 'package:world_commerce/presentation/pages/main/main.dart';

import 'package:world_commerce/presentation/pages/signin/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/repository/add_product.dart';
import 'package:world_commerce/repository/get_brands_list.dart';
import 'package:world_commerce/repository/get_categories_list.dart';
import 'package:world_commerce/repository/get_subCategories_list.dart';
import 'package:world_commerce/repository/login_repo.dart';
import 'package:world_commerce/repository/signup_repo.dart';

import 'Services/get_products.dart';

import 'bloc/change_page/increase_page_bloc.dart';
import 'bloc/login_bloc/login_bloc.dart';
import 'bloc/number_of_pages_bloc/number_of_pages_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dotenv.load(fileName: '.env');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");

// print('email is ${email}');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(
            loginRepo: LoginRepo(),
          ),
        ),
        BlocProvider(
          create: (_) => SaveLoginBloc(),
        ),
        BlocProvider(
          create: (_) => SignUpBloc(
            singUpRepo: SingUpRepo(),
          ),
        ),
        BlocProvider(
          create: (_) => AddProductBloc(
            addProductRepo: AddProductRepo(),
          ),
        ),
        BlocProvider(
          create: (_) => GetProductBloc(
              getProducts: GetProducts(), changePageBloc: IncreasePageBloc()),
        ),
        BlocProvider(
          create: (_) => IncreasePageBloc(),
        ),
        BlocProvider(
          create: (_) => NumberOfPagesBloc(
            getProducts: GetProducts(),
          ),
        ),
        BlocProvider(
          create: (_) => CategoriesListBloc(
            getCategoriesRepository: GetCategoriesRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => SubCategoriesListBloc(
              subCategoriesRepository: GetSubCategoriesRepository()),
        ),
        BlocProvider(
            create: (_) =>
                BrandsListBloc(getBrandsRepository: GetBrandsRepository())),
        BlocProvider(create: (_) => GetUserBloc(getUser: GetUser()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: token == null ? Signin() : const Main(),
      ),
    ),
  );
}
