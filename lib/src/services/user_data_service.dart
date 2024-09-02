import 'dart:convert';

import 'package:assignment_2/src/modules/verbersuggesties/model/user_data_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'https://reqres.in/api/';
  Future<UserDataModel> fetchUsers(int page) async {
    // print("Mayank - 1 : DB");
    final response = await http.get(Uri.parse('${baseUrl}users?page=$page'));
    if (response.statusCode == 200) {
      // print("Mayank - 1 : DB ${response.body}");
      final data = json.decode(response.body);
      return UserDataModel.fromJson(data);
    } else {
      throw Exception('Failed to load users: ${response.reasonPhrase}');
    }
  }
}
