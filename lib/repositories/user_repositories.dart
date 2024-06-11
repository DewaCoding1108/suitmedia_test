import 'package:suitmedia_test/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {

  Future<List<User>> fetchUsers(int page, int limit) async {
    final response = await http.get(Uri.parse("https://reqres.in/api/users?page=$page&per_page=$limit"));
    // await get("${_baseUrl}users?page=$page&limit=$limit");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final userList = data['data'] as List;
      return List<User>.from(userList.map((user) => User.fromJson(user)).toList());
      // return List<User>.from(data.map((e) => User.fromJson(e)));
    } else {
      throw Exception('Failed to load users');
    }
    // final data = response.body;
    // return List<User>.from(data.map((e) => User.fromJson(e)));
  }
}