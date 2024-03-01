import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/models/wishlist/wishlist_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Services/http_error_handler.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../exception/loading_exception.dart';
import '../models/wishlist/add_to_wishlist_model.dart';

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
    return data;
  }

  Future<AddToWishListModel> addToWishList(String productId) async {
    try {
      final String token;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (prefs.getString("token") == null) {
        token = loginBloc.state.responseModel.token;
      } else {
        token = prefs.getString("token").toString();
      }
      final response = await http.patch(
          Uri.parse(
            dotenv.env['WISH_LIST'].toString(),
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "token": token.toString()
          },
          body: jsonEncode(
            <String, String>{
              "product": productId,
            },
          ));

      AddToWishListModel result =
          AddToWishListModel.fromJson(jsonDecode(response.body));
      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      // ignore: unnecessary_null_comparison
      if (result == null) {
        throw LoadingException('Something went wrong');
      }

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AddToWishListModel> deleteFromWishList(String productId) async {
    try {
      final String token;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (prefs.getString("token") == null) {
        token = loginBloc.state.responseModel.token;
      } else {
        token = prefs.getString("token").toString();
      }
      final response = await http.delete(
          Uri.parse(
            dotenv.env['WISH_LIST'].toString(),
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "token": token.toString()
          },
          body: jsonEncode(
            <String, String>{
              "product": productId,
            },
          ));

      AddToWishListModel result =
          AddToWishListModel.fromJson(jsonDecode(response.body));
      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      // ignore: unnecessary_null_comparison
      if (result == null) {
        throw LoadingException('Something went wrong');
      }

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
