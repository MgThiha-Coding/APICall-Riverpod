import 'package:api_call/data/model/userprofile_model.dart';
import 'package:api_call/data/service/userprofile_service.dart';
import 'package:api_call/state/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStateNotifier extends Notifier<AppState> {
  final UserprofileService _userprofileService = UserprofileService();
  @override
  AppState build() {
    return AppStateInitial();
  }

  Future<void> getData() async {
    try {
      state = AppStateLoading();
      final List<UserProfileModel> profileData =
          await _userprofileService.getData();
      state = AppStateSuccess(profileData);
    } catch (e) {
      state = AppStateFailed(e.toString());
    }
  }
}

final appStateProvider = NotifierProvider<AppStateNotifier, AppState>(() {
  return AppStateNotifier();
});
