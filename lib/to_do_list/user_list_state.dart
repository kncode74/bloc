import 'package:state_bloc/data/user_response.dart';

abstract class UserListState {
  final List<UserResponse> userList;

  UserListState({required this.userList});
}

class UserListInitial extends UserListState {
  UserListInitial({required super.userList});
}

class UserListUpdated extends UserListState {
  UserListUpdated({required super.userList});
}
