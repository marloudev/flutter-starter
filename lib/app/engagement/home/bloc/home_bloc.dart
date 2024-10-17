import 'package:bloc/bloc.dart';
import 'package:empireone_mart/app/engagement/home/model/home_model.dart';
import 'package:empireone_mart/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc(this._homeRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
       try {
        emit(HomeLoading(message: 'Loading...'));
        List<HomeModel> data = await _homeRepository.fetchPosts();
        emit(HomeLoaded(posts: data));
      } catch (e) {
        emit(HomeError(message: 'Something went wrong!'));
      }
    });
  }
}
