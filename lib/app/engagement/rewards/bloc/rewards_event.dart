part of 'rewards_bloc.dart';

@immutable
sealed class RewardsEvent {}

class fetchRewards extends RewardsEvent{}