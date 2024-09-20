import 'package:api_call/data/model/userprofile_model.dart';

sealed class AppState {}

class AppStateInitial extends AppState {}

class AppStateLoading extends AppState {}

class AppStateSuccess extends AppState {
  final List<UserProfileModel> profiledata;
  AppStateSuccess(this.profiledata);
}

class AppStateFailed extends AppState {
  final String errorMessage;
  AppStateFailed(this.errorMessage);
}
