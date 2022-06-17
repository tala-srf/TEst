part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {
  CommentInitial();
}

class loadingComments extends CommentState {}

class NOComments extends CommentState {}

class CreateComments extends CommentState {
  CommentModel? comments;

  CreateComments({
    required this.comments,
  });
}

class Error1State extends CommentState {}

class completed extends CommentState {

}
