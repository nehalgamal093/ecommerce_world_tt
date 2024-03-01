import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/account_page/custom_widgets/profile_field.dart';
import 'package:world_commerce/presentation/pages/account_page/custom_widgets/profile_label.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/assets_manager.dart';
import '../../edit_account/screens/edit_account.dart';

Widget profile(
    BuildContext context, String username, String email, String phone) {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        profilePicture(context, username),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditAccount(name: username, email: email, phone: phone),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(S.of(context).editProfile),
              ),
            ),
          ),
        ),
        profileLabel(S.of(context).name, context),
        const SizedBox(height: 10),
        profileField(username, false, true, userNameController, context),
        const SizedBox(height: 15),
        profileLabel(S.of(context).email, context),
        const SizedBox(height: 10),
        profileField(email, false, true, emailController, context),
        const SizedBox(height: 15),
        profileLabel(S.of(context).username, context),
        const SizedBox(height: 10),
        profileField('@nehalGamal', false, true, userNameController, context),
        const SizedBox(height: 15),
        profileLabel(S.of(context).address, context),
        const SizedBox(height: 10),
        profileField(phone, false, true, phoneController, context),
        const SizedBox(height: 15),
        profileLabel(S.of(context).address, context),
        const SizedBox(height: 10),
        profileField(
            'Milky way St 23 ', false, true, addressController, context),
        const SizedBox(height: 40),
      ],
    ),
  );
}

String capitalizeName(String username) {
  return username[0].toUpperCase() + username.substring(1).toLowerCase();
}

Widget profilePicture(BuildContext context, String username) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            child: Image.asset(AssetsManager.cat),
          ),
          Text(
            capitalizeName(username),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
//90 ✅
