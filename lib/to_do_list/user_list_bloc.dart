import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/repository/api_repository.dart';
import 'package:state_bloc/to_do_list/user_list_event.dart';
import 'package:state_bloc/to_do_list/user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final ApiRepository apiRepository = ApiRepository();

  UserListBloc() : super(UserListInitial(userList: [])) {
    on<AddUser>(_addUser);
    on<DeleteUser>(_deleteUser);
    on<UpdateUser>(_updatedUser);
    on<FetchUserList>(_fetchUserList);
  }

  _addUser(AddUser event, Emitter<UserListState> emit) {
    state.userList.add(event.user);
    emit(UserListUpdated(userList: state.userList));
  }

  _deleteUser(DeleteUser event, Emitter<UserListState> emit) {
    state.userList.remove(event.user);
    emit(UserListUpdated(userList: state.userList));
  }

  _updatedUser(UpdateUser event, Emitter<UserListState> emit) {
    for (var user in state.userList) {
      if (user == event.user) {
        emit(UserListUpdated(userList: state.userList));
      }
    }
  }

  _fetchUserList(FetchUserList event, Emitter<UserListState> emit) async {
    try {
      final users = await apiRepository.fetchTasks();
      emit(UserListUpdated(userList: users));
    } catch (e) {
      throw ('Failed to load users: $e');
      // emit(UserListError(message: "Failed to load users: $e"));
    }
  }
}
