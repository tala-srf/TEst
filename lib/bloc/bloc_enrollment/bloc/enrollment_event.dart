part of 'enrollment_bloc.dart';

@immutable
abstract class EnrollmentEvent {}
class CreateEnrollmentEvent extends EnrollmentEvent {
EnrollmentModel create;


  CreateEnrollmentEvent({required this.create});
}