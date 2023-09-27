import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:world_commerce/Services/auth_service.dart';

class LoginRepo {
  AuthService authService = AuthService();
  Future<void> login(String email, String password) async {
    final response = await authService.authPost(
        <String, String>{"email": email, "password": password},
        dotenv.env['LOGIN_URL']!);

    return response;
  }
}
