import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/features/authentication/models/user_model.dart';
import 'package:login/src/repository/authentication_repository/authentication_repository.dart';
import 'package:login/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();




  // -- repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());


  // get user email and pass to userrepository to fetch user record.
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to Continue!");
    }
  }
  // fetch the list of user records
  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.getAllUser();
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
