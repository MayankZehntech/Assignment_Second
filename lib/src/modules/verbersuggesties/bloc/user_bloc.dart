import 'package:assignment_2/src/modules/verbersuggesties/bloc/user_state.dart';
import 'package:assignment_2/src/modules/verbersuggesties/model/user_data_model.dart';

import 'package:assignment_2/src/services/user_data_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;
  //Api current page
  int _currentPage = 1;
  // list to store the data from api
  final List<Datum> newUserList = [];
  //checking for loading first time in init state
  bool isLoadingFirsttime = true;

  UserBloc(this.userService) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    if (isLoadingFirsttime == true) {
      isLoadingFirsttime = false;
      emit(UserLoading());
    }
    // print("Mayank - 0 : On");

    try {
      final userListData = await userService.fetchUsers(_currentPage);
      // print("Mayank - 2 : On");
      final List<Datum> users = userListData.data;

      // print('API userListData: ${users}');

      // Adding all the data from Api to list
      newUserList.addAll(users);

      // this condition check total page of api is equal to the current page then no need to load the data
      if (userListData.totalPages == _currentPage) {
        isLoadingFirsttime = true;

        emit(UserLoaded(users: userListData.data, hasReachedMax: false));
      } else {
        _currentPage++;

        emit(UserLoaded(users: userListData.data, hasReachedMax: true));
      }
    } catch (e) {
      // print("Mayank - 4 : On $e");
      emit(UserError(message: 'Failed to load users: ${e.toString()}'));
    }
    //   }
  }
}
