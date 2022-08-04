part of 'datauser_bloc.dart';

@immutable
abstract class DatauserState {}

class DatauserInitial extends DatauserState {

}

// ignore: must_be_immutable
class Success12356State extends DatauserState {
  DataUserModel data;
  Success12356State({required this.data});
}



class LoadState extends DatauserState {}

class E extends DatauserState {}
