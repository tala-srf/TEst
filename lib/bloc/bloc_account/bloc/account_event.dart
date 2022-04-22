part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

class CreateAcountEvent extends AccountEvent {
  NewAccountModel create;
  CreateAcountEvent(this.create);
}
