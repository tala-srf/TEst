part of 'newcomment_bloc.dart';

@immutable
abstract class NewcommentState {}

class NewcommentInitial extends NewcommentState {}

class GetComment extends NewcommentState {
  Comments new1;
  GetComment(this.new1);
}
class ErrorGet extends NewcommentState{}
class LoadingComment extends NewcommentState{}
