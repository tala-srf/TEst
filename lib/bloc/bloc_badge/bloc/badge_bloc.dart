import 'package:ajyal/models/badge_model.dart';
import 'package:ajyal/service/badge_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'badge_event.dart';
part 'badge_state.dart';

class BadgeBloc extends Bloc<BadgeEvent, BadgeState> {
  BadgeBloc() : super(BadgeInitial()) {
    on<LoadBadgeEvent>((event, emit) async {
      emit(LoadingBadge());
      try {
        BadgeModel badge = await badgeService.gatbadges(
          (await SharedPreferences.getInstance()).getString('backend_token') ??
              'EMPTY_TOKEN',
        );

        emit(FetchBadge(badge: badge));
      } catch (e) {
        ErrorFetchBadge();
      }
    });
  }
  BadgeService badgeService = BadgeService();
}
