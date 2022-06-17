// import 'package:ajyal/models/comment_model.dart';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:ajyal/models/post_model.dart';
// import 'package:ajyal/service/new_comment.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// part 'newcomment_event.dart';
// part 'newcomment_state.dart';

// class NewcommentBloc extends Bloc<NewcommentEvent, NewcommentState> {
//   NewcommentBloc() : super(NewcommentInitial()) {
//     on<NewCommentEvent>((event, emit) async {
//       emit(LoadingComment());
//       try {
       
//         CommentModel newcomment = await commentService.newcomment(
//             (await SharedPreferences.getInstance())
//                     .getString('backend_token') ??
//                 'EMPTY_TOKEN',
//            (await SharedPreferences.getInstance()).getInt("id_comment") ??0 );
//         emit(GetComment(newcomment));
//       } catch (e) {
//         emit(ErrorGet());
//       }
//     });
//   }
// }

// final NewCommentService commentService = NewCommentService();
