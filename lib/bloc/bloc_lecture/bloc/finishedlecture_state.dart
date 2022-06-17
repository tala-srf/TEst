part of 'finishedlecture_bloc.dart';

@immutable
abstract class FinishedlectureState {}

class FinishedlectureInitial extends FinishedlectureState {}
class LoadingFinished extends FinishedlectureState {}

class NOFinished extends FinishedlectureState {}

class CreateFinished extends FinishedlectureState {
  FinishedLectureModel? finished;

  CreateFinished({
    required this.finished,
  });
}

class Error6State extends FinishedlectureState {}

class Completed6 extends FinishedlectureState {}