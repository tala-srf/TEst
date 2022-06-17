part of 'datauser_bloc.dart';

@immutable
abstract class DatauserState {}

class DatauserInitial extends DatauserState {

}

// ignore: must_be_immutable
class Successed12356State extends DatauserState {
  DataUserModel data;
  Successed12356State({required this.data});
}

class NoConnectionState extends DatauserState {}

class Loading1State extends DatauserState {}

class EState extends DatauserState {}
