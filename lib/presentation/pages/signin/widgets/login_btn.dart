import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../bloc/login_bloc/login_bloc.dart';
import '../../../../bloc/save_login/save_login_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../main/main.dart';

Widget loginBtn(BuildContext context, TextEditingController emailController,
    TextEditingController passwordController) {
  double width = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: () async {
      context.read<LoginBloc>().add(
            Login(
                email: emailController.text, password: passwordController.text),
          );
      final saveStatus = context.read<SaveLoginBloc>().state.saveLoginStatus;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', emailController.text);
      if (saveStatus == SaveLoginStatus.save) {
        prefs.setBool("saveLogin", true);
      }
    },
    child: BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loadingStatus == LoginStatus.loaded) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const Main(),
            ),
          );
        } else if (state.loadingStatus == LoginStatus.error) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(
          //       LoginRepo.errMsg!,
          //       style: const TextStyle(color: Colors.white),
          //     ),
          //   ),
          // );
        }
      },
      //Button loading when waiting the request
      // if there is an error the loading will stop and show snackbar with error message
      child: Container(
        padding: const EdgeInsets.all(4),
        width: width * .80,
        height: 45,
        decoration: const BoxDecoration(
          color: ColorManager.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: context.watch<LoginBloc>().state.loadingStatus ==
                  LoginStatus.loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  S.of(context).login,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    ),
  );
}
//73✅