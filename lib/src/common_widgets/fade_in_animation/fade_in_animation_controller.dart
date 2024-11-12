import 'package:get/get.dart';
import 'package:login/src/features/authentication/screens/welcome/welcome_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future<void> startSplashAnimation() async {
    await Future.delayed(Duration(milliseconds: 300));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(Duration(milliseconds: 2000));
    // Get.to( OnBoardingScreen());
    Get.offAll(() => WelcomeScreen());
  }


   Future<void> startAnimation() async {
    await Future.delayed(Duration(milliseconds: 400));
    animate.value = true;
  }
}
