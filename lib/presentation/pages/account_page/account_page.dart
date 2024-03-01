import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/get_user_bloc/get_user_bloc.dart';
import 'package:world_commerce/bloc/login_bloc/login_bloc.dart';
import 'package:world_commerce/presentation/pages/account_page/custom_widgets/profile.dart';
import '../../../Services/get_user.dart';
import 'custom_widgets/skeleton_profile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
                  return profile(context, state.data.userName, state.data.email,
                      state.data.phone);
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
//41 ✅
