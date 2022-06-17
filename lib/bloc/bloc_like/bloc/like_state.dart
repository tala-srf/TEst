part of 'like_bloc.dart';

@immutable
abstract class LikeState {}

class LikeInitial extends LikeState {
  LikeInitial();
}



class loadingLike extends LikeState {}

class NOLike extends LikeState {}

class CreateLike extends LikeState {
  LikeModel? like;

  CreateLike({
    required this.like,
  });
}

class Error2State extends LikeState {}

class completed2 extends LikeState {}
