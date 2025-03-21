part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  final String message;

  HomeLoading({required this.message});
}

class HomeLoaded extends HomeState {
  final List<ModuleModel> modules;
  HomeLoaded({required this.modules});
}

class HomeLoadedId extends HomeState {
  final modules;
  HomeLoadedId({required this.modules});
}

class GetScoreLoaded extends HomeState {
  final modules;
  GetScoreLoaded({required this.modules});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
