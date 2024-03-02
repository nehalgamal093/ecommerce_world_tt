import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/login_bloc/login_bloc.dart';
import '../../../../Services/get_user.dart';
import '../../../../generated/l10n.dart';

Widget editAccountBtn(
    BuildContext context,
    TextEditingController userNameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    String name,
    String email,
    String phone) {
  final loginBloc = BlocProvider.of<LoginBloc>(context);

  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          GetUser(loginBloc).updateUser(
              userNameController.text.isEmpty ? name : userNameController.text,
              emailController.text.isEmpty ? email : emailController.text,
              phoneController.text.isEmpty ? phone : phoneController.text);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          child: Text(S.of(context).editProfile),
        ),
      ),
    ),
  );
}
//35✅