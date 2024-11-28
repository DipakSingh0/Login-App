import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
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
    ever(firebaseUser, setInitialScreen);
  }

  // setInitialScreen(User? user) {
  //   user == null
  //       ? Get.offAll(() => const WelcomeScreen())
  //       : Get.offAll(() => const Dashboard());
  // }

  setInitialScreen(User? user) async {
    if (user == null) {
      await Future.delayed(const Duration(seconds: 5)); // Delay for animation
      Get.offAll(() => const WelcomeScreen());
    } else {
      Get.offAll(() => const Dashboard());
    }
  }

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
    } catch (_) {
      const ex = SignupEmailPasswordFailure();
      print('Exception - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {
      // print(e);
    }
  }

  // Future<void> phoneAuthentication(String phoneNo) async {
  //   await auth.verifyPhoneNumber(
  //     phoneNumber: phoneNo,
  //     verificationCompleted: (credentials) async {
  //       await auth.signInWithCredential(credentials);
  //     },
  //     codeSent: (verificationId, resendToken) {
  //       this.verificationId.value = verificationId ;
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) {
  //       this.verificationId.value = verificationId ;
  //     },
  //     verificationFailed: (e) {
  //       if(e.code == 'invalid-phone-number') {
  //         Get.snackbar("Error", 'The phone number is invalid.');
  //       } else {
  //         Get.snackbar("Error", 'Something went wrong, try again');
  //       }
  //     },
  //   );
  // }


Future<void> phoneAuthentication(String phoneNo) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credentials) async {
          try {
            await auth.signInWithCredential(credentials);
            print("Verification completed: User signed in successfully.");
          } catch (signInError) {
            print("Error during sign-in: $signInError");
            Get.snackbar("Error", "Failed to sign in with credentials.");
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
          print("Code sent to $phoneNo. Verification ID: $verificationId");
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
          print("Auto-retrieval timeout. Verification ID: $verificationId");
        },
        verificationFailed: (e) {
          print("Verification failed: ${e.message}");
          if (e.code == 'invalid-phone-number') {
            Get.snackbar("Error", "The phone number is invalid.");
          } else {
            Get.snackbar("Error", "Something went wrong, try again.");
          }
        },
      );
    } catch (e) {
      // Handle unexpected exceptions
      print("Unexpected error in phone authentication: $e");
      Get.snackbar("Error", "An unexpected error occurred. Please try again.");
    }
  }

 

  Future<bool> verifyOTP(String otp) async {
    var credentials = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> logout() async => await auth.signOut();
}

/* 

 keytool -list -v -keystore "C:\Users\Admin\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
 C:\Users\Admin\.android
*/
