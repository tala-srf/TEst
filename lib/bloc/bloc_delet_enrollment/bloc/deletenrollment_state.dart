part of 'deletenrollment_bloc.dart';

@immutable
abstract class DeletenrollmentState {}

class DeletenrollmentInitial extends DeletenrollmentState {}
class SuccessedS12Delet extends DeletenrollmentState {
  Enrollments? delet;
  SuccessedS12Delet(this.delet);
}
class LoadingDeletenrollment extends DeletenrollmentState {}
class FailedDeletenrollment extends DeletenrollmentState {}
