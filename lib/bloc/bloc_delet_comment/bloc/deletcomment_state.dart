part of 'deletcomment_bloc.dart';

@immutable
abstract class DeletcommentState {}

class DeletcommentInitial extends DeletcommentState {}

class SuccessedSDelet extends DeletcommentState {
  Comments? delet;
  SuccessedSDelet(this.delet);
}
class LoadingDeletComment extends DeletcommentState {}
class FailedDeletComment extends DeletcommentState {}
