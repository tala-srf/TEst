part of 'like_bloc.dart';

@immutable
abstract class LikeEvent {}
class CreateLikeEvent extends LikeEvent {
LikeModel create;


  CreateLikeEvent({required this.create});
}