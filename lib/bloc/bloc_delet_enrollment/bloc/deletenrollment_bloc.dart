import 'package:ajyal/models/courses_model.dart';
import 'package:ajyal/service/delet_enrollment_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'deletenrollment_event.dart';
part 'deletenrollment_state.dart';

class DeletenrollmentBloc
    extends Bloc<DeletenrollmentEvent, DeletenrollmentState> {
  DeletenrollmentBloc() : super(DeletenrollmentInitial()) {
    on<DeletenrollmEvent>((event, emit) async {
      emit(LoadingDeletenrollment());
      try {
        Enrollments? delet = await deletservice.deletEnrollment(
            (await SharedPreferences.getInstance())
                    .getString('backend_token') ??
                'EMPTY_TOKEN',
            (await SharedPreferences.getInstance())
                    .getInt('id_delet_enrolment') ??
                0);
        emit(SuccessedS12Delet(delet));
      } catch (e) {
        emit(FailedDeletenrollment());
      }
    });
  }
}

final DeletEnrollmentService deletservice = DeletEnrollmentService();
