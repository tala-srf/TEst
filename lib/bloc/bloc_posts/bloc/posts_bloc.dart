import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:ajyal/models/post_model.dart';
import 'package:ajyal/service/post_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial() ) {
    on<LoadEvent>((event, emit) async {
      emit(loadingPosts());
      try {
        List<PostModel> posts = await postservice.getallpost(
          (await SharedPreferences.getInstance()).getString('backend_token') ??
              'EMPTY_TOKEN',
        );
        
        emit(FetchPosts(posts: posts));
      } catch (e) {
        emit(ErrorState());
      }

      // ignore: unnecessary_cast
    });}
   
  PostService postservice = PostService();
}
