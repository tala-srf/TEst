part of 'alluser_bloc.dart';

@immutable
abstract class AlluserState {}

class AlluserInitial extends AlluserState {}

class SuccessedState extends AlluserInitial {
   List<TopModel>? data1;
   List<TopModel>? data2;
  SuccessedState({required this.data1,this.data2});
}

class NoConnectionState extends AlluserInitial {}

class LoadingState extends AlluserInitial {}

class EState extends AlluserInitial {}