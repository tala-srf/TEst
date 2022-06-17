import 'package:ajyal/models/enrollment_model.dart';
import 'package:ajyal/service/enrollment_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'enrollment_event.dart';
part 'enrollment_state.dart';

class EnrollmentBloc extends Bloc<EnrollmentEvent, EnrollmentState> {
  EnrollmentBloc() : super(EnrollmentInitial()) {
    on<CreateEnrollmentEvent>((event, emit) async{
     emit(loadingEnrollment());

      EnrollmentModel? enrollment1 = await enrollmentservice.enrollment(
        event.create,
        (await SharedPreferences.getInstance()).getString('backend_token') ??
            'EMPTY_TOKEN',
      );

      enrollment1 == null
          ? emit(Error3State())
          : {emit(CreateEnrollment(enrollment: enrollment1)), emit(EnrollmentInitial())};
    });
  }

  EnrollmentService enrollmentservice = EnrollmentService();
}
