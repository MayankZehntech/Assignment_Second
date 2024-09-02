import 'dart:convert';

import 'package:assignment_2/src/modules/home/model/home_data_model.dart';
import 'package:http/http.dart' as http;

class HomeDataService {
  final String url = 'https://reqres.in/api/users?page=1';

  Future<List<HomeDataModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> usersJson = data['data'];
      return usersJson.map((json) => HomeDataModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
