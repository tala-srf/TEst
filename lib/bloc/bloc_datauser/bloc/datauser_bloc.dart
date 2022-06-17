

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:ajyal/models/signin_model.dart';
import 'package:ajyal/service/data_signin_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'datauser_event.dart';
part 'datauser_state.dart';

class DatauserBloc extends Bloc<DatauserEvent, DatauserState> {
  DatauserBloc() : super(DatauserInitial()) {
    on<LoaddataEvent>((event, emit) async {
      emit(Loading1State());
      try {
        DataUserModel data = await userService.datauser1(
          (await SharedPreferences.getInstance()).getString('backend_token') ??
              'EMPTY_TOKEN',
        );

        emit(Successed12356State(data: data));
          SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
           sharedPreferences.setInt('id_student', data.data?.student?.id ?? 0);
      
      } 
      catch (e) {
        emit(EState());
      }
    });
  }
}

DataSignin userService = DataSignin();
