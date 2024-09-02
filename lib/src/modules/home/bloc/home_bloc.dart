import 'package:assignment_2/src/modules/home/bloc/home_state.dart';

import 'package:assignment_2/src/services/home_data_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeDataService homeService;
  HomeBloc(this.homeService) : super(HomeInitial()) {
    on<FetchHomeUsers>(_onHomeFetchUsers);
  }

  void _onHomeFetchUsers(FetchHomeUsers event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final users = await homeService.fetchUsers();
      emit(HomeLoaded(users));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
