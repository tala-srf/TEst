part of 'datauser_bloc.dart';

@immutable
abstract class DatauserEvent {}

class LoaddataEvent extends DatauserEvent {
  LoaddataEvent();
}
