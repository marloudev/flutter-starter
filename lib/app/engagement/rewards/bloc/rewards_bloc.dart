import 'package:bloc/bloc.dart';
import 'package:empireone_mart/app/engagement/home/model/rewards_model.dart';
import 'package:empireone_mart/repository/rewards_repository.dart';
import 'package:meta/meta.dart';

part 'rewards_event.dart';
part 'rewards_state.dart';

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  final RewardsRepository _rewardsRepository;
  RewardsBloc(this._rewardsRepository) : super(RewardsInitial()) {
    on<RewardsEvent>((event, emit) async {
      try {
        emit(RewardsLoading(message: 'Loading...'));
        List<RewardsModel> data = await _rewardsRepository.fetchRewards();
        emit(RewardsLoaded(rewards: data));
      } catch (e) {
        emit(RewardsError(message: 'Something went wrong!'));
      }
    });
  }
}
