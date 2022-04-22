part of 'alluser_bloc.dart';

@immutable
abstract class AlluserState {}

class AlluserInitial extends AlluserState {}

class SuccessedState extends AlluserInitial {
   List<DataUserModel>? data1;
  SuccessedState({required this.data1});
}

class NoConnectionState extends AlluserInitial {}

class LoadingState extends AlluserInitial {}

class EState extends AlluserInitial {}