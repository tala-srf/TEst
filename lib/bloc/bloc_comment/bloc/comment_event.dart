part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}


class CreateCommentEvent extends CommentEvent {
Comments create;


  CreateCommentEvent({required this.create});
}