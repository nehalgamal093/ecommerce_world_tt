import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Services/auth_service.dart';
import '../../../../bloc/sign_up_bloc/sign_up_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';
import '../../signin/signin.dart';

Widget signupBtn(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController phoneController,
    TextEditingController nameController) {
  return InkWell(
    onTap: () async {
      context.read<SignUpBloc>().add(SignupEv(
          email: emailController.text,
          password: passwordController.text,
          phone: phoneController.text,
          username: nameController.text));
    },
    child: BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.loadingStatus == SignUpStatus.loaded) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => Signin(
                isRegisteredSuccess: true,
              ),
            ),
          );
        } else if (state.loadingStatus == SignUpStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                AuthService.errMsg!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width * .80,
        height: 45,
        decoration: const BoxDecoration(
            color: ColorManager.blue,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: context.watch<SignUpBloc>().state.loadingStatus ==
                  SignUpStatus.loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  S.of(context).siginup,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
        ),
      ),
    ),
  );
}
