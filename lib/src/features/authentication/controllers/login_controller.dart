// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:login/src/repository/authentication_repository/authentication_repository.dart';

// class LoginController extends GetxController {
//   static LoginController get instance => Get.find();

//   // TextField Controllers to get data from TextFields
//   final showPassword = false.obs;
//   final email = TextEditingController();
//   final password = TextEditingController();
//   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

//   // Loader
//   final isLoading = false.obs;
//   final isGoogleLoading = false.obs;
//   final isFacebookLoading = false.obs;

//   // EmailAndPasswordLogin
//   Future<void> login() async {
//     try {
//       isLoading.value = true;
//       if (loginFormKey.currentState!.validate()) {
//         isLoading.value = false;
//         return;
//       }

//     // await AuthenticationRepository.instance.loginUserWithEmailAndPassword(email.text.trim(), password.text.trim() );
//     // AuthenticationRepository.instance.setInitialScreen(user);

//       final auth = AuthenticationRepository.instance;
//       await auth.loginUserWithEmailAndPassword(email.text.trim(), password.text.trim());
//       auth.setInitialScreen(auth.firebaseUser as User?);
//     } catch (e) {
//       isLoading.value = false;
//        Get.snackbar(
//       'Error', // Title
//       e.toString(), // Message
//       snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
//       backgroundColor: Colors.red, // Background color
//       colorText: Colors.white, // Text color
//     );
//     }
//   }
// }




// Future<void> login() async {
//   try {
//     isLoading.value = true;

//     if (loginFormKey.currentState!.validate()) {
//       isLoading.value = false;
//       return;
//     }

//     final auth = AuthenticationRepository.instance;
//     await auth.loginUserWithEmailAndPassword(email.text.trim(), password.text.trim());
//     auth.setInitialScreen(auth.firebaseUser as User?);
//   } catch (e) {
//     isLoading.value = false;
//     Get.snackbar(
//       'Error', // Title
//       e.toString(), // Message
//       snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
//       backgroundColor: Colors.red, // Background color
//       colorText: Colors.white, // Text color
//     );
//   }
// }