import 'package:ajyal/models/top_three_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:ajyal/service/all_user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'alluser_event.dart';
part 'alluser_state.dart';

class AlluserBloc extends Bloc<AlluserEvent, AlluserState> {
  AlluserBloc() : super(AlluserInitial()) {
 on<Loaddata1Event>((event, emit) async {
      emit(LoadingState());
      try {
       List< TopModel>? data1 = await alluserService.datatop(
          (await SharedPreferences.getInstance()).getString('backend_token') ??
              'EMPTY_TOKEN',
        );
         List< TopModel>? data2 = await alluserService.datatopcourse(
          (await SharedPreferences.getInstance()).getString('backend_token') ??
              'EMPTY_TOKEN',
        );

        emit(SuccessedState(data1: data1,data2: data2));
         
      } 
      catch (e) {
        emit(EState());
      }
    });
  }
}
DataSignin alluserService = DataSignin();