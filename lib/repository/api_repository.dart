import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:state_bloc/data/user_response.dart';

class ApiRepository {
  Future<List<UserResponse>> fetchTasks() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/mock_data_list.json');
      final List<dynamic> data = jsonDecode(response);

      return data.map((json) => UserResponse.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load tasks: $e");
    }
  }
}
