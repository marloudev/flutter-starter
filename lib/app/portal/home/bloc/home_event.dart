part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class fetchModules extends HomeEvent {}

class getModuleById extends HomeEvent {}

class getModuleByQuarter extends HomeEvent {}

class getScoreEvent extends HomeEvent {}
