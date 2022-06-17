import 'package:ajyal/models/like_model.dart';
import 'package:ajyal/service/like_service.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeInitial()) {
    on<CreateLikeEvent>((event, emit) async {
      emit(loadingLike());

      LikeModel? like1 = await likeservice.createlike(
        event.create,
        (await SharedPreferences.getInstance()).getString('backend_token') ??
            'EMPTY_TOKEN',
      );

      like1 == null
          ? emit(Error2State())
          : {emit(CreateLike(like: like1)), emit(LikeInitial())};
    });
  }

  LikeService likeservice = LikeService();
}
