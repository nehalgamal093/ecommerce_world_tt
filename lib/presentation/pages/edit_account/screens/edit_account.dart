import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/top_bar.dart';
import 'package:world_commerce/presentation/pages/account_page/custom_widgets/profile_field.dart';
import 'package:world_commerce/presentation/pages/edit_account/widgets/edit_account_btn.dart';
import '../../../../generated/l10n.dart';
import '../../account_page/custom_widgets/profile_label.dart';
import '../widgets/account_header.dart';

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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  accountHeader(context, name),
                  const SizedBox(height: 40),
                  profileLabel(S.of(context).name, context),
                  const SizedBox(height: 10),
                  profileField(name, false, false, userNameController, context),
                  const SizedBox(height: 15),
                  profileLabel(S.of(context).email, context),
                  const SizedBox(height: 10),
                  profileField(email, false, false, emailController, context),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  profileLabel(S.of(context).phone, context),
                  const SizedBox(height: 10),
                  profileField(phone, false, false, phoneController, context),
                  const SizedBox(height: 15),
                  profileLabel(S.of(context).address, context),
                  const SizedBox(height: 10),
                  profileField('Milky way St 23 ', false, false,
                      addressController, context),
                  const SizedBox(height: 70),
                  editAccountBtn(context, userNameController, emailController,
                      phoneController, name, email, phone)
                ],
              )),
        ),
      ),
    );
  }
}
//66✅