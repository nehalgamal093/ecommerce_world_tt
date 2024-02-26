import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../models/cart_model/CartResponseModel.dart';

class GetCartList {
  final LoginBloc loginBloc;

  const GetCartList(this.loginBloc);
  Future<CartResponseModel> fetchCartList() async {
    final String token;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("token") == null) {
      token = loginBloc.state.responseModel.token;
    } else {
      token = prefs.getString("token").toString();
    }

    try {
      final response = await http.get(
          Uri.parse(dotenv.env['CART_LIST'].toString()),
          headers: {"token": token});
      CartResponseModel productModel =
          CartResponseModel.fromJson(json.decode(response.body));

      if (response.statusCode == 201) {
        return productModel;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
