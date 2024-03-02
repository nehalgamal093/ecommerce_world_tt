import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/signin/widgets/do_not_have_account_btn.dart';
import 'package:world_commerce/presentation/pages/signin/widgets/forgot_password.dart';
import 'package:world_commerce/presentation/pages/signin/widgets/login_btn.dart';
import 'package:world_commerce/presentation/pages/signin/widgets/login_success_text.dart';
import 'package:world_commerce/presentation/pages/signin/widgets/save_login_btn.dart';
import 'package:world_commerce/presentation/pages/signup/widgets/input_text.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';
import '../../../generated/l10n.dart';

class Signin extends StatelessWidget {
  final bool isRegisteredSuccess;
  Signin({super.key, this.isRegisteredSuccess = false});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        //Starting page
        body: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            margin: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                forgotPassword(context),
                const SizedBox(height: 50),
                loginSuccessText(isRegisteredSuccess, context),
                const SizedBox(height: 50),

                Text(
                  S.of(context).welcome,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  S.of(context).pleaseEnterYourData,
                  style:
                      const TextStyle(color: ColorManager.grey, fontSize: 15),
                ),
                const SizedBox(height: 20),
                //starting form email and password
                InputText(
                  controller: emailController,
                  labelText: S.of(context).email,
                  icon: Icons.person_outline,
                  hintText: 'nehalgamal',
                  isPassword: false,
                ),
                InputText(
                  controller: passwordController,
                  labelText: S.of(context).password,
                  icon: Icons.lock_outline,
                  hintText: '•••••••',
                  isPassword: true,
                ),
                //Remember me switch button
                saveLoginBtn(context),
                const SizedBox(height: 20),
                //Button for logging and accessing the home page if email & password are right
                // If Email and password not write it will show you snackbar with error message
                loginBtn(context, emailController, passwordController),
                const SizedBox(height: 50),
                donotHaveAccountBtn(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//78✅