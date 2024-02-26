import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/login_bloc/login_bloc.dart';

class BlocProvider extends InheritedWidget {
  final LoginBloc loginBloc;

  const BlocProvider({
    Key? key,
    required this.loginBloc,
    required Widget child,
  }) : super(key: key, child: child);

  static LoginBloc of(BuildContext context) =>
      Provider.of<BlocProvider>(context, listen: false).loginBloc;

  @override
  bool updateShouldNotify(covariant BlocProvider oldWidget) =>
      loginBloc != oldWidget.loginBloc;
}
