import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/add_product_bloc/add_product_bloc.dart';
import 'package:world_commerce/bloc/bloc/number_of_pages_bloc.dart';
import 'package:world_commerce/bloc/get_products_bloc/get_product_bloc.dart';

import 'package:world_commerce/bloc/save_login/save_login_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:world_commerce/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:world_commerce/presentation/pages/error_screen/error_screen.dart';
import 'package:world_commerce/presentation/pages/main/main.dart';
import 'package:world_commerce/presentation/pages/products_screen/products_screen.dart';
import 'package:world_commerce/presentation/pages/signin/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/repository/add_product.dart';
import 'package:world_commerce/repository/login_repo.dart';
import 'package:world_commerce/repository/signup_repo.dart';

import 'Services/get_products.dart';

import 'bloc/change_page/increase_page_bloc.dart';
import 'bloc/login_bloc/login_bloc.dart';

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
