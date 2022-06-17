part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}


class CreateCommentEvent extends CommentEvent {
CommentModel create;


  CreateCommentEvent({required this.create});
}