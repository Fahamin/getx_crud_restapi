import 'package:get/get.dart';

import '../api/api_service.dart';
import '../model/model.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      var fetchedUsers = await ApiService.getUsers();
      users.assignAll(fetchedUsers);
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  Future<void> addUser(User user) async {
    try {
      var addedUser = await ApiService.addUser(user);
      users.add(addedUser);
    } catch (e) {
      print("Error adding user: $e");
    }
  }

  Future<void> updateUser(User user) async {
    try {
      await ApiService.updateUser(user);
      var index = users.indexWhere((u) => u.id == user.id);
      if (index != -1) {
        users[index] = user;
      }
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  Future<void> deleteUser(int userId) async {
    try {
      await ApiService.deleteUser(userId);
      users.removeWhere((user) => user.id == userId);
    } catch (e) {
      print("Error deleting user: $e");
    }
  }
}
