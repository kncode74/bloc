import 'package:state_bloc/data/user_response.dart';

abstract class UserListEvent {}

class AddUser extends UserListEvent {
  final UserResponse user;

  AddUser({required this.user});
}

class DeleteUser extends UserListEvent {
  final UserResponse user;

  DeleteUser({required this.user});
}

class UpdateUser extends UserListEvent {
  final UserResponse user;

  UpdateUser({required this.user});
}

class FetchUserList extends UserListEvent {}
