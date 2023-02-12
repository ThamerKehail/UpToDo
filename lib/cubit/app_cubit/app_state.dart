part of "app_cubit.dart";

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AppSuccess extends AppState {}

class AppFailure extends AppState {
  final String errorMessage;
  AppFailure(this.errorMessage);
}
