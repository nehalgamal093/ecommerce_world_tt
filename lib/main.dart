import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:world_commerce/Services/get_cart_list.dart';
import 'package:world_commerce/Services/get_user.dart';
import 'package:world_commerce/bloc/add_product_bloc/add_product_bloc.dart';
import 'package:world_commerce/bloc/brands_list_bloc/brands_list_bloc.dart';
import 'package:world_commerce/bloc/categories_list_bloc/categories_list_bloc.dart';
import 'package:world_commerce/bloc/change_language_bloc/change_language_bloc.dart';
import 'package:world_commerce/bloc/change_theme_bloc/change_theme_bloc.dart';
import 'package:world_commerce/bloc/get_cart_list/get_cart_list_bloc.dart';
import 'package:world_commerce/bloc/get_products_bloc/get_product_bloc.dart';
import 'package:world_commerce/bloc/get_user_bloc/get_user_bloc.dart';
import 'package:world_commerce/bloc/save_login/save_login_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:world_commerce/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:world_commerce/bloc/sub_categories_list_bloc/sub_categories_list_bloc.dart';
import 'package:world_commerce/generated/l10n.dart';
import 'package:world_commerce/presentation/pages/main/main.dart';
import 'package:world_commerce/presentation/pages/signin/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/presentation/resources/theme_manager.dart';
import 'package:world_commerce/repository/add_product.dart';
import 'package:world_commerce/repository/get_brands_list.dart';
import 'package:world_commerce/repository/get_categories_list.dart';
import 'package:world_commerce/repository/get_subCategories_list.dart';
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
  var isDark = prefs.getBool("isDark");

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
            getProducts: GetProducts(),
          ),
        ),
        BlocProvider(
          create: (_) => GetCartListBloc(getCartList: GetCartList())
            ..add(
              CartEvent(),
            ),
        ),
        BlocProvider(
          create: (_) => IncreasePageBloc(),
        ),
        BlocProvider(
          create: (_) => CategoriesListBloc(
            getCategoriesRepository: GetCategoriesRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => SubCategoriesListBloc(
            subCategoriesRepository: GetSubCategoriesRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => BrandsListBloc(
            getBrandsRepository: GetBrandsRepository(),
          ),
        ),
        BlocProvider(
          create: (_) => GetUserBloc(
            getUser: GetUser(),
          ),
        ),
        BlocProvider(
          create: (_) => ChangeThemeBloc(isDark: isDark!)
            ..add(
              InitialThemeEvent(),
            ),
        ),
        BlocProvider(
          create: (_) => ChangeLanguageBloc()..add(SavedLanguageEvent()),
        ),
      ],
      child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
        builder: (context, state) {
          return MaterialApp(
            locale: context.watch<ChangeLanguageBloc>().state.langStatus ==
                    LangStatus.en
                ? const Locale("ar")
                : const Locale("en"),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'World Ecommerce',
            debugShowCheckedModeBanner: false,
            theme: state.changeThemeStatus == ChangeThemeStatus.dark
                ? getAppTheme(true)
                : getAppTheme(false),
            home: token == null ? Signin() : const Main(),
          );
        },
      ),
    ),
  );
}
