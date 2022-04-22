part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class LoadEvent extends PostsEvent {
  LoadEvent();
}


