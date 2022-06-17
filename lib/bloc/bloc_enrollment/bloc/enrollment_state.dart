part of 'enrollment_bloc.dart';

@immutable
abstract class EnrollmentState {}

class EnrollmentInitial extends EnrollmentState {}

class loadingEnrollment extends EnrollmentState {}

class NOEnrollment extends EnrollmentState {}

class CreateEnrollment extends EnrollmentState {
  EnrollmentModel? enrollment;

  CreateEnrollment({
    required this.enrollment,
  });
}

class Error3State extends EnrollmentState {}

class completed3 extends EnrollmentState {}
