import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:world_commerce/Services/auth_service.dart';

class SingUpRepo {
  AuthService authService = AuthService();
  Future<void> singUp(
      String email, String password, String phone, String name) async {
    final response = await authService.authPost(<String, String>{
      "name": name,
      "email": email,
      "password": password,
      "phone": phone
    }, dotenv.env['SIGN_UP_URL']!);
    return response;
  }
}
