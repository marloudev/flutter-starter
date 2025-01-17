import 'package:bloc/bloc.dart';
import 'package:empireone_mart/app/model/module_model.dart';
import 'package:empireone_mart/repository/module_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ModuleRepository _moduleRepository;
  HomeBloc(this._moduleRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      try {
        emit(HomeLoading(message: 'Loading...'));
        List<ModuleModel> response = await _moduleRepository.fetchModules();
        emit(HomeLoaded(modules: response));
      } catch (e) {
        emit(HomeError(message: 'Something went wrong!'));
      }
    });
  }
}
