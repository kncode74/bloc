import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc/di/initial.binding.dart';
import 'package:state_bloc/to_do_list/user_list.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: DiBloc.providers(),
      child: const MaterialApp(
        title: 'CRUD with BLOC',
        themeMode: ThemeMode.light,
        home: UserListView(),
      ),
    );
  }
}
