import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/login_bloc/login_bloc.dart';
import 'package:world_commerce/presentation/custom_widgets/top_bar.dart';
import 'package:world_commerce/presentation/pages/account_page/custom_widgets/profile_field.dart';
import 'package:world_commerce/presentation/resources/assets_manager.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

import '../../../../Services/get_user.dart';
import '../../../../generated/l10n.dart';

import '../../account_page/custom_widgets/profile_label.dart';

class EditAccount extends StatelessWidget {
  final String name;

  final String email;
  final String phone;
  EditAccount(
      {super.key,
      required this.name,
      required this.email,
      required this.phone});

  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      appBar: topBar(S.of(context).editProfile, true, context, false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                              radius: 60,
                              child: Image.asset(AssetsManager.cat)),
                          const Text(
                            'Nehal Gamal',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '@nehalGamal',
                            style: TextStyle(
                                fontSize: 15, color: ColorManager.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  profileLabel(S.of(context).name, context),
                  const SizedBox(height: 10),
                  profileField(name, false, false,
                      TextEditingController(text: name.toString()), context),
                  const SizedBox(height: 15),
                  profileLabel(S.of(context).email, context),
                  const SizedBox(height: 10),
                  profileField(email, false, false,
                      TextEditingController(text: email), context),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  profileLabel(S.of(context).phone, context),
                  const SizedBox(height: 10),
                  profileField(phone, false, false,
                      TextEditingController(text: phone), context),
                  const SizedBox(height: 15),
                  profileLabel(S.of(context).address, context),
                  const SizedBox(height: 10),
                  profileField('Milky way St 23 ', false, false,
                      addressController, context),
                  const SizedBox(height: 70),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            GetUser(loginBloc).updateUser(
                                TextEditingController(text: name).text,
                                TextEditingController(text: email).text,
                                TextEditingController(text: phone).text);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            child: Text(S.of(context).editProfile),
                          )),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
//83