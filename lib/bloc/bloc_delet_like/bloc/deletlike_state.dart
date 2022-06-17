part of 'deletlike_bloc.dart';

@immutable
abstract class DeletlikeState {}

class DeletlikeInitial extends DeletlikeState {}
class SuccessedSDeletLike extends DeletlikeState {
  Likes? delet;
  SuccessedSDeletLike(this.delet);
}
class FailedDeletlike extends DeletlikeState {}
class LoadingDeletlike extends DeletlikeState {}
