part of 'badge_bloc.dart';

@immutable
abstract class BadgeEvent {}
class LoadBadgeEvent extends BadgeEvent {
  LoadBadgeEvent();
}