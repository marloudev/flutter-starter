part of 'rewards_bloc.dart';

@immutable
sealed class RewardsState {}

final class RewardsInitial extends RewardsState {}


class RewardsLoading extends RewardsState {
  final String message;

  RewardsLoading({required this.message});
}

class RewardsLoaded extends RewardsState {
  final List<RewardsModel> rewards;

  RewardsLoaded({required this.rewards});
}

class RewardsError extends RewardsState {
  final String message;

  RewardsError({required this.message});
}