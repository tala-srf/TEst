import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ajyal/models/post_model.dart';
import 'package:ajyal/service/delet_comment.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'deletcomment_event.dart';
part 'deletcomment_state.dart';

class DeletcommentBloc extends Bloc<DeletcommentEvent, DeletcommentState> {
  DeletcommentBloc() : super(DeletcommentInitial()) {
    on<DeletCommEvent>((event, emit) async {
      emit(LoadingDeletComment());
      try {
        Comments? delet = await deletservice.deletComment(
            (await SharedPreferences.getInstance())
                    .getString('backend_token') ??
                'EMPTY_TOKEN',
            (await SharedPreferences.getInstance()).getInt('id_delet_comment') ?? 0);
        emit(SuccessedSDelet(delet));
      } catch (e) {
        emit(FailedDeletComment());
      }
    });
  }
}

final DeletCommentService deletservice = DeletCommentService();
