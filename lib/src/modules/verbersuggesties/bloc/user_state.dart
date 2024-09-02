import 'package:assignment_2/src/modules/verbersuggesties/model/user_data_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<Datum> users;
  // final List<UserDataModel> users;
  final bool hasReachedMax;
  // final ;
  const UserLoaded({required this.users, required this.hasReachedMax});

  @override
  List<Object?> get props => [users, hasReachedMax];
}

class UserError extends UserState {
  final String message;
  const UserError({required this.message});

  @override
  List<Object?> get props => [message];
}
