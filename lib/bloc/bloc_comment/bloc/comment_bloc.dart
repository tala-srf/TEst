

import 'package:ajyal/models/comment_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



import 'package:ajyal/service/comment_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial()) {
    on<CreateCommentEvent>((event, emit) async {
      emit(loadingComments());

      CommentModel? comment1 = await commentservice.createcomment(
        event.create,
        (await SharedPreferences.getInstance()).getString('backend_token') ??
            'EMPTY_TOKEN',
      );

      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      // sharedPreferences.setInt("id_comment", comment1?.id ?? 0);

      comment1 == null
          ? emit(Error1State())
          : {emit(CreateComments(comments: comment1)), emit(CommentInitial())};
    });
  }

  CommentService commentservice = CommentService();
}
