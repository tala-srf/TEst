part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}

class SuccessedAccontState extends AccountState {
  NewAccountModel? account;
  SuccessedAccontState(this.account);
}

class FaildAccount extends AccountState{}

class NoConnectionState extends AccountState {}
class LoadAccountState extends AccountState {}