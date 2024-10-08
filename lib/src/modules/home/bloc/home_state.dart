import 'package:assignment_2/src/modules/home/model/home_data_model.dart';

import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeDataModel> users;
  HomeLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
