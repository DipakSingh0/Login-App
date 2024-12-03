import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login/src/features/authentication/models/user_model.dart';
import 'package:login/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:login/src/repository/authentication_repository/authentication_repository.dart';
import 'package:login/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //textfield controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

// from design call this funciton
  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

 Future <void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OtpScreen());
  }

    void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
