import 'package:ajyal/models/finished_lecture_model.dart';
import 'package:ajyal/service/finished_lecture_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'finishedlecture_event.dart';
part 'finishedlecture_state.dart';

class FinishedlectureBloc extends Bloc<FinishedlectureEvent, FinishedlectureState> {
  FinishedlectureBloc() : super(FinishedlectureInitial()) {
    on<CreateFinishedEvent>((event, emit) async{
     emit(LoadingFinished());

      FinishedLectureModel? finished1 = await finishedservice.finishedservice(
        event.create,
        (await SharedPreferences.getInstance()).getString('backend_token') ??
            'EMPTY_TOKEN',
      );

      finished1 == null
          ? emit(Error6State())
          : {emit(CreateFinished(finished:  finished1)), emit(FinishedlectureInitial())};
    });
  }

  FinishedLectureService finishedservice = FinishedLectureService();
}

