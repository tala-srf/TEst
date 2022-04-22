part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class loadingPosts extends PostsState {}

class FetchPosts extends PostsState {
  List<PostModel> posts;


  FetchPosts({required this.posts});
}



class ErrorState extends PostsState {}


