
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login/src/repository/authentication_repository/authentication_repository.dart';

class SignUpController  extends GetxController{
  static SignUpController get instance => Get.find();

  //textfield controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

// from design call this funciton
 void registerUser( String email , String password) {
  AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  


 }

}