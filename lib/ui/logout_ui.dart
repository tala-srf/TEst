import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ajyal/bloc/bloc_auth/bloc/auth_bloc.dart';

class Logout extends StatelessWidget {
   Logout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Navigator.of(context)
            .pushNamedAndRemoveUntil('/SignIn', (route) => !route.isFirst);
             BlocProvider.of<AuthBloc>(context).add(SignOutEvent());

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/SignIn', (route) => !route.isFirst);
      },
      builder: (context, state) {
        if (state is ProcessingLogOutState) {
          return const CircularProgressIndicator();
        } else {
          return GestureDetector(
            onTap: () => BlocProvider.of<AuthBloc>(context).add(SignOutEvent()),
            child: const ListTile(
              title: Text("logout"),
            ),
          );
        }
      },
    );
  }
}
