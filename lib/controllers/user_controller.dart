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