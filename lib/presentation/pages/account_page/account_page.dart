import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/top_bar.dart';
import 'package:world_commerce/presentation/pages/account_page/custom_widgets/profile_field.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

import 'custom_widgets/profile_label.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: topBar('Account', true, context),
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
                SizedBox(height: 40),
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                profileLabel('Name'),
                SizedBox(height: 10),
                profileField('Nehal Gamal'),
                SizedBox(height: 15),
                profileLabel('Email Address'),
                SizedBox(height: 10),
                profileField('nehal@email.com'),
                SizedBox(height: 15),
                profileLabel('Username'),
                SizedBox(height: 10),
                profileField('@nehalGamal'),
                SizedBox(height: 15),
                profileLabel('Password'),
                SizedBox(height: 10),
                profileField('123456'),
                SizedBox(height: 15),
                profileLabel('Phone Number'),
                SizedBox(height: 10),
                profileField('943746772766564'),
                SizedBox(height: 15),
                profileLabel('Address'),
                SizedBox(height: 10),
                profileField('Milky way St 23 '),
                SizedBox(height: 40),
              ],
            ),
          ),
        ));
  }
}
