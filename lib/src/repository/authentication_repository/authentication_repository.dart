import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login/src/features/core/screens/dashboard.dart';

import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {                                 // call this onready on main.dart
    firebaseUser = Rx<User?>(auth.currentUser);
    // this will wathc on users
    firebaseUser.bindStream(auth.userChanges());
    //this is to prform some action to user
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const Dashboard());
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

  Future<void> logout() async => await auth.signOut();
}
