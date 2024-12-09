import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/features/authentication/screens/login/login_screen.dart';
import 'package:login/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login/src/features/core/screens/dashboard/dashboard.dart';
import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    // call this onready on main.dart
    firebaseUser = Rx<User?>(auth.currentUser);
    // this will wathc on users
    firebaseUser.bindStream(auth.userChanges());
    //this is to prform some action to user
    // FlutterNativeSplash.remove();          //--------eemailverifn addthis
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User? user) async {
    if (user == null) {
      await Future.delayed(const Duration(seconds: 5)); // Delay for animation
      Get.offAll(() => const WelcomeScreen());
    } else {
      Get.offAll(() => const Dashboard());
    }
  }
  /*  -------------email verifcation --------------- */
  //   setInitialScreen(User? user) async {
  //   await Future.delayed(const Duration(seconds: 5));
  //   user == null
  //       ? Get.offAll(() => const WelcomeScreen())
  //       : user.emailVerified
  //           ? Get.offAll(() => const Dashboard())
  //           : Get.offAll(() => const MailVerification());
  //           // : Get.offAll(() => const SignupScreen());

  // }

  // ----------email verification------------------//
  // Future<void> sendEmailVerification() async {
  //   try {
  //     await auth.currentUser?.sendEmailVerification();
  //   } on FirebaseAuthException catch (e) {
  //     final ex = Exceptions.fromCode(e.code);
  //     throw ex.message;
  //   } catch (_) {
  //     const ex = Exceptions();
  //     throw ex.message;
  //   }
  // }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupEmailPasswordFailure.code(e.code);
      Get.snackbar("Error", ex.message);
    } catch (_) {
      const ex = SignupEmailPasswordFailure();
      Get.snackbar("Error", ex.message);
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "An error occurred. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (_) {
      // print(e);
      Get.snackbar(
        "Error",
        "An unexpected error occurred. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credentials) async {
        await auth.signInWithCredential(credentials);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar("Error", 'The phone number is invalid.');
        } else {
          Get.snackbar("Error", 'Something went wrong, try again');
        }
      },
    );
  }

// ----------phone no OTP verification------------------//
  Future<bool> verifyOTP(String otp) async {
    var credentials = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  // Future<void> logout() async => await auth.signOut();

  // ----------LOGOUT-----------------//
  Future<void> logout() async {
    try {
      // await GoogleSignIn.instance.signOut();
      // await FacebookAuth.instance.logOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      throw "Unable to logout.Please try again.";
    }
  }
}

// Future<void> phoneAuthentication(String phoneNo) async {
//     try {
//       await auth.verifyPhoneNumber(
//         phoneNumber: phoneNo,
//         verificationCompleted: (credentials) async {
//           try {
//             await auth.signInWithCredential(credentials);
//             print("Verification completed: User signed in successfully.");
//           } catch (signInError) {
//             print("Error during sign-in: $signInError");
//             Get.snackbar("Error", "Failed to sign in with credentials.");
//           }
//         },
//         codeSent: (verificationId, resendToken) {
//           this.verificationId.value = verificationId;
//           print("Code sent to $phoneNo. Verification ID: $verificationId");
//         },
//         codeAutoRetrievalTimeout: (verificationId) {
//           this.verificationId.value = verificationId;
//           print("Auto-retrieval timeout. Verification ID: $verificationId");
//         },
//         verificationFailed: (e) {
//           print("Verification failed: ${e.message}");
//           if (e.code == 'invalid-phone-number') {
//             Get.snackbar("Error", "The phone number is invalid.");
//           } else {
//             Get.snackbar("Error", "Something went wrong, try again.");
//           }
//         },
//       );
//     } catch (e) {
//       // Handle unexpected exceptions
//       print("Unexpected error in phone authentication: $e");
//       Get.snackbar("Error", "An unexpected error occurred. Please try again.");
//     }
//   }
