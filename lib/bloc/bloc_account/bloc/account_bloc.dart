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
        emit(SuccessedAccontState(account));
    
      } catch (e) {
        emit(FaildAccount());
      }
    });
  }
}

NewAccountService accountservice = NewAccountService();
