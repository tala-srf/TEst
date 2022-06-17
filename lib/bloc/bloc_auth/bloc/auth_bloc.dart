// ignore_for_file: prefer_function_declarations_over_variables, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:ajyal/models/me.dart';

import 'package:ajyal/service/data_signin_service.dart';
import 'package:ajyal/service/signin_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>(Signin);
    on<SignOutEvent>(SignOut);
  }
}

final authService = SignInService();
final userService = DataSignin();

// non_constant_identifier_names
dynamic Signin = (event, emit) async {
  emit(ProcessingSignInState());
  AuthModel? user = await authService.authUser(event.user);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString('backend_user', user.toString());
  sharedPreferences.setString("backend_token", user?.token ?? 'EMPTY_TOKEN');
  sharedPreferences.setString("login", user?.email ?? 'EMPTY_TOKEN');

  user == null
      ? emit(FaildAuthState())
      : emit(SuccessedSignInState(
          user: user,
        ));
};

dynamic SignOut = (event, emit) async {
  emit(ProcessingLogOutState());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString('backend_token', 'EMPTY_TOKEN');
  emit(LogOutState());
  emit(AuthInitial());
};
