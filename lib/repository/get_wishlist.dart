import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/models/wishlist/wishlist_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../bloc/login_bloc/login_bloc.dart';

class GetWishList {
  final LoginBloc loginBloc;

  const GetWishList(this.loginBloc);
  Future<WishListModel> getWishList() async {
    final String token;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("token") == null) {
      token = loginBloc.state.responseModel.token;
    } else {
      token = prefs.getString("token").toString();
    }
    final response = await http.get(
        Uri.parse(
          dotenv.env['WISH_LIST'].toString(),
        ),
        headers: {"token": token});

    WishListModel data = WishListModel.fromJson(json.decode(response.body));
    print('Response wishlist ${data.likedProducts}');
    return data;
  }
}
