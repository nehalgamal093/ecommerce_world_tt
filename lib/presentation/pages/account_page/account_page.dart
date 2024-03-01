import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_user_bloc/get_user_bloc.dart';
import 'package:world_commerce/bloc/login_bloc/login_bloc.dart';
import 'package:world_commerce/presentation/pages/account_page/custom_widgets/profile_field.dart';
import 'package:world_commerce/presentation/pages/edit_account/screens/edit_account.dart';
import 'package:world_commerce/presentation/resources/assets_manager.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';
import '../../../Services/get_user.dart';
import '../../../generated/l10n.dart';
import 'custom_widgets/profile_label.dart';
import 'custom_widgets/skeleton_profile.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: BlocProvider(
            create: (context) => GetUserBloc(getUser: GetUser(loginBloc))
              ..add(GetUserDataEvent()),
            child: BlocBuilder<GetUserBloc, GetUserState>(
              builder: (context, state) {
                if (state.loadingStatus == UserStatus.loading) {
                  return skeletonProfile();
                } else if (state.loadingStatus == UserStatus.loaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditAccount(
                                            name: state.data.userName,
                                            email: state.data.email,
                                            phone: state.data.phone)));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Text(S.of(context).editProfile),
                              ),
                            ),
                          ),
                        ),
                        profileLabel(S.of(context).name, context),
                        const SizedBox(height: 10),
                        profileField(state.data.userName, false, true,
                            userNameController, context),
                        const SizedBox(height: 15),
                        profileLabel(S.of(context).email, context),
                        const SizedBox(height: 10),
                        profileField(state.data.email, false, true,
                            emailController, context),
                        const SizedBox(height: 15),
                        profileLabel(S.of(context).username, context),
                        const SizedBox(height: 10),
                        profileField('@nehalGamal', false, true,
                            userNameController, context),
                        const SizedBox(height: 15),
                        profileLabel(S.of(context).address, context),
                        const SizedBox(height: 10),
                        profileField(state.data.phone, false, true,
                            phoneController, context),
                        const SizedBox(height: 15),
                        profileLabel(S.of(context).address, context),
                        const SizedBox(height: 10),
                        profileField('Milky way St 23 ', false, true,
                            addressController, context),
                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                } else {
                  return const Text('Error');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
