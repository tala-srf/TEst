part of 'finishedlecture_bloc.dart';

@immutable
abstract class FinishedlectureEvent {}

class CreateFinishedEvent extends FinishedlectureEvent {
  FinishedLectureModel create;

  CreateFinishedEvent({required this.create});
}
