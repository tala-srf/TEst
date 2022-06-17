part of 'badge_bloc.dart';

@immutable
abstract class BadgeState {}

class BadgeInitial extends BadgeState {}
class LoadingBadge extends BadgeState {}

class FetchBadge extends BadgeState {
  BadgeModel badge;

  FetchBadge({required this.badge});
}

class ErrorFetchBadge extends BadgeState {}