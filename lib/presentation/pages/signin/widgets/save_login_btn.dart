import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/save_login/save_login_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../resources/color_manager.dart';

Widget saveLoginBtn(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        S.of(context).rememberMe,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      Switch(
          activeTrackColor: ColorManager.green,
          value: context.watch<SaveLoginBloc>().state.saveLoginStatus ==
              SaveLoginStatus.save,
          onChanged: (val) {
            context.read<SaveLoginBloc>().add(SaveEvent());
          }),
    ],
  );
}
//26✅