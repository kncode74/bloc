import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/to_do_list/user_list_bloc.dart';

class DiBloc {
  static List<BlocProvider> providers() {
    return [
      BlocProvider<UserListBloc>(
        create: (context) => UserListBloc(),
      ),
    ];
  }
}
