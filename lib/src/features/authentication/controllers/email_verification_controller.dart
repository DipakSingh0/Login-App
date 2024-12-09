// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:login/src/repository/authentication_repository/authentication_repository.dart';

// class MailVerificationController extends GetxController {
//   late Timer timer;
//   @override
//   void onInit() {
//     super.onInit();
//     sendVerificationEmail();
//     setTimerForAutoRedirect();
//   }

//   /// Send OR Resend Email Verification
//   Future<void> sendVerificationEmail() async {
//     try {
//       await AuthenticationRepository.instance.
//       sendEmailVerification();
//     } catch (e) {
//       // Helper.errorSnackBar(title: ohSnap , message: e.toString());
//       Get.snackbar(
//         'Error',
//         e.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }

//   /// Set Timer to check if Verification Completed then Redirect
//   void setTimerForAutoRedirect() {
//     timer = Timer.periodic(const Duration(seconds: 5), (timer) {
//       FirebaseAuth.instance.currentUser?.reload();
//       final user = FirebaseAuth.instance.currentUser;
//       if (user!.emailVerified) {
//         timer.cancel();
//         AuthenticationRepository.instance.setInitialScreen(user);
//       }
//     });
//   }

//   /// Manually Check if Verification Completed then Redirect
//   void manuallyCheckEmailVerificationStatus() {
//     FirebaseAuth.instance.currentUser?.reload();
//     final user = FirebaseAuth.instance.currentUser;
//     if (user!.emailVerified) {
//       AuthenticationRepository.instance.setInitialScreen(user);
//       }
//   }
// }
