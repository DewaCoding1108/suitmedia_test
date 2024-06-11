// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/user.dart';

// class UserController extends GetxController {
//   var users = <User>[].obs;
//   var selectedUser = ''.obs;
//   var isLoading = false.obs;
//   var currentPage = 1.obs;

//   @override
//   void onInit() {
//     fetchUsers();
//     super.onInit();
//   }

//   Future<void> fetchUsers() async {
//     isLoading(true);
//     try {
//       final response = await http.get(Uri.parse('https://reqres.in/api/users?page=${currentPage.value}&per_page=10'));
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         var userList = data['data'] as List;
//         users.addAll(userList.map((user) => User.fromJson(user)).toList());
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void loadMoreUsers() {
//     currentPage.value++;
//     fetchUsers();
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/repositories/user_repositories.dart';
import 'package:suitmedia_test/models/user.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final int _limit = 10;
  int _page = 1;
  var hasMore = true.obs;
  var selectedUser = Rxn<User>();
  var users = <User>[].obs;
  var isLoading = false.obs;

  Future getUser() async {
    isLoading(true);
    try {
      List<User> response = await _userRepository.fetchUsers(_page, _limit);
      if (response.length < _limit) {
        hasMore.value = false;
      }
      users.addAll(response);
      _page++;
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally{
      isLoading(false);
    }
  }

  Future refreshData() async {
    _page = 1;
    hasMore.value = true;
    users.value = [];

    await getUser();
  }
}