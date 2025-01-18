import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/card_content.dart';
import 'package:state_bloc/data/user_response.dart';
import 'package:state_bloc/to_do_list/user_list_bloc.dart';
import 'package:state_bloc/to_do_list/user_list_event.dart';
import 'package:state_bloc/to_do_list/user_list_state.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  void initState() {
    super.initState();
    context.read<UserListBloc>().add(FetchUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hogwarts'),
      ),
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state.userList.isEmpty) {
            return const Center(child: Text('No data'));
          }
          return ListView.builder(
            itemCount: state.userList.length,
            itemBuilder: (context, index) {
              UserResponse user = state.userList[index];
              return CardContent(
                user: user,
                onDelete: () {
                  context.read<UserListBloc>().add(DeleteUser(user: user));
                },
              );
            },
          );
        },
      ),
    );
  }
}
