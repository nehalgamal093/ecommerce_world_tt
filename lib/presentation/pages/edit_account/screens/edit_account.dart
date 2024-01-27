import 'package:flutter/material.dart';

import 'package:world_commerce/presentation/custom_widgets/btn.dart';
import 'package:world_commerce/presentation/custom_widgets/top_bar.dart';
import 'package:world_commerce/presentation/pages/account_page/custom_widgets/profile_field.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

import '../../../../Services/get_user.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topBar('Account', true, context, false),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 60, child: Image.asset('assets/images/cat.png')),
                const Text(
                  'Nehal Gamal',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '@nehalGamal',
                  style: TextStyle(fontSize: 15, color: ColorManager.grey),
                ),
                const SizedBox(height: 40),
                profileLabel('Name'),
                const SizedBox(height: 10),
                profileField(name, false, false,
                    TextEditingController(text: name.toString())),
                const SizedBox(height: 15),
                profileLabel('Email Address'),
                const SizedBox(height: 10),
                profileField(
                    email, false, false, TextEditingController(text: email)),
                const SizedBox(height: 15),
                const SizedBox(height: 15),
                profileLabel('Phone Number'),
                const SizedBox(height: 10),
                profileField(
                    phone, false, false, TextEditingController(text: phone)),
                const SizedBox(height: 15),
                profileLabel('Address'),
                const SizedBox(height: 10),
                profileField(
                    'Milky way St 23 ', false, false, addressController),
                const SizedBox(height: 40),
                InkWell(
                    onTap: () {
                      GetUser().updateUser(
                          TextEditingController(text: name).text,
                          TextEditingController(text: email).text,
                          TextEditingController(text: phone).text);
                    },
                    child: btn('Edit Account'))
              ],
            )),
      ),
    );
  }
}
