
import 'package:get/get.dart';
import 'package:login/src/features/core/screens/dashboard/dashboard.dart';
import 'package:login/src/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {

  static OTPController get instance => Get.find();

  Future<void> verifyOTP(String otp) async {
   var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
   isVerified ? Get.offAll(const Dashboard()) : Get.back();
  }
}