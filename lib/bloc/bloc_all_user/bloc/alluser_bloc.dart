import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ajyal/models/signin_model.dart';
import 'package:ajyal/service/all_user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'alluser_event.dart';
part 'alluser_state.dart';

class AlluserBloc extends Bloc<AlluserEvent, AlluserState> {
  AlluserBloc() : super(AlluserInitial()) {
 on<Loaddata1Event>((event, emit) async {
      emit(LoadingState());
      try {
       List< DataUserModel>? data1 = await alluserService.dataalluser(
          (await SharedPreferences.getInstance()).getString('backend_token') ??
              'EMPTY_TOKEN',
        );

        emit(SuccessedState(data1: data1));
         
      } 
      catch (e) {
        emit(EState());
      }
    });
  }
}
DataSignin alluserService = DataSignin();