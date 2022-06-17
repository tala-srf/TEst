import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ajyal/models/new_account_model.dart';
import 'package:ajyal/service/new_account_service.dart';


part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<CreateAcountEvent>((event, emit) async {
      emit(LoadAccountState());
      try {
        NewAccountModel? account = await accountservice.createaccount(
          event.create, 
        );
  //        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // sharedPreferences.setString('backend_user', account.toString());
  // sharedPreferences.setString("backend_token", account?.token ?? 'EMPTY_TOKEN');
  // sharedPreferences.setString("login", account?.email ?? 'EMPTY_TOKEN');
        emit(SuccessedAccontState(account));
    
      } catch (e) {
        emit(FaildAccount());
      }
    });
  }
}

NewAccountService accountservice = NewAccountService();
