import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/signup/widgets/already_have_Account_text.dart';
import 'package:world_commerce/presentation/pages/signup/widgets/input_text.dart';
import 'package:world_commerce/presentation/pages/signup/widgets/sign_up_btn.dart';
import 'package:world_commerce/presentation/pages/signup/widgets/terms_and_conditions_text.dart';
import '../../../generated/l10n.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      S.of(context).needHelp,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).letstart,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  S.of(context).singupAndContinue,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                InputText(
                  controller: emailController,
                  labelText: S.of(context).email,
                  icon: Icons.email_outlined,
                  hintText: 'nehal@email.com',
                  isPassword: false,
                ),
                InputText(
                  controller: nameController,
                  labelText: S.of(context).username,
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
                InputText(
                  controller: phoneController,
                  labelText: S.of(context).phone,
                  icon: Icons.person_outline,
                  hintText: 'Phone',
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                signupBtn(context, emailController, passwordController,
                    phoneController, nameController),
                const SizedBox(height: 20),
                alreadyHaveAccountText(context),
                const SizedBox(height: 20),
                termsAndConditionsText(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//96✅