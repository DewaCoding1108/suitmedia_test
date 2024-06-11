import 'package:suitmedia_test/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {

  Future<List<User>> fetchUsers(int page, int limit) async {
    final response = await http.get(Uri.parse("https://reqres.in/api/users?page=$page&per_page=$limit"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final userList = data['data'] as List;
      return List<User>.from(userList.map((user) => User.fromJson(user)).toList());
    } else {
      throw Exception('Failed to load users');
    }
  }
}