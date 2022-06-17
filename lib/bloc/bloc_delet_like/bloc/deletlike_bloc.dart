import 'package:ajyal/models/post_model.dart';
import 'package:ajyal/service/delet_like_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'deletlike_event.dart';
part 'deletlike_state.dart';

class DeletlikeBloc extends Bloc<DeletlikeEvent, DeletlikeState> {
  DeletlikeBloc() : super(DeletlikeInitial()) {
    on<Deletlike1Event>((event, emit) async {
      emit(LoadingDeletlike());
      try {
        Likes? delet = await deletservice.deletlike(
            (await SharedPreferences.getInstance())
                    .getString('backend_token') ??
                'EMPTY_TOKEN',
            (await SharedPreferences.getInstance()).getInt('id_delet_like') ?? 0);
        emit(SuccessedSDeletLike(delet));
      } catch (e) {
        emit(FailedDeletlike());
      }
    });
  }
}

final DeletLikeService deletservice = DeletLikeService();
