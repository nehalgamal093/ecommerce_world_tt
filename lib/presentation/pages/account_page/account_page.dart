import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_user_bloc/get_user_bloc.dart';
import 'package:world_commerce/presentation/custom_widgets/top_bar.dart';
import 'package:world_commerce/presentation/pages/account_page/custom_widgets/profile_field.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

import '../../../Services/get_user.dart';
import 'custom_widgets/profile_label.dart';
import 'custom_widgets/skeleton_profile.dart';

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
          child: BlocProvider(
            create: (context) =>
                GetUserBloc(getUser: GetUser())..add(GetUserDataEvent()),
            child: BlocBuilder<GetUserBloc, GetUserState>(
              builder: (context, state) {
                if (state.loadingStatus == UserStatus.loading) {
                  return skeletonProfile();
                } else if (state.loadingStatus == UserStatus.loaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 60,
                          child: Image.asset('assets/images/cat.png')),
                      const Text(
                        'Nehal Gamal',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '@nehalGamal',
                        style:
                            TextStyle(fontSize: 15, color: ColorManager.grey),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        width: 150,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: const Center(
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
                      const SizedBox(height: 10),
                      profileField(state.data['name'], false),
                      const SizedBox(height: 15),
                      profileLabel('Email Address'),
                      const SizedBox(height: 10),
                      profileField(state.data['email'], false),
                      const SizedBox(height: 15),
                      profileLabel('Username'),
                      const SizedBox(height: 10),
                      profileField('@nehalGamal', false),
                      const SizedBox(height: 15),
                      profileLabel('Password'),
                      const SizedBox(height: 10),
                      profileField(state.data['password'], true),
                      const SizedBox(height: 15),
                      profileLabel('Phone Number'),
                      const SizedBox(height: 10),
                      profileField(state.data['phone'], false),
                      const SizedBox(height: 15),
                      profileLabel('Address'),
                      const SizedBox(height: 10),
                      profileField('Milky way St 23 ', false),
                      const SizedBox(height: 40),
                    ],
                  );
                } else {
                  return Text('Error');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
