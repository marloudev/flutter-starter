part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


class HomeLoading extends HomeState {
  final String message;

  HomeLoading({required this.message});
}

class HomeLoaded extends HomeState {
  final List<HomeModel> posts;

  HomeLoaded({required this.posts});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}