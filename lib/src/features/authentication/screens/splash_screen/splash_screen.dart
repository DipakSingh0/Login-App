import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/authentication/controllers/splash_screen_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

// creating instance of controller
  final splashController = Get.put(SplashScreenController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    // initializing the animation using controller
    splashController.startAnimation();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // wrapping with Obx the animation
            Obx(
              () => AnimatedPositioned(
                duration: Duration(milliseconds: 1200),

            //using splashcontroller.animate.value for animation
                top: splashController.animate.value ? 0 : -20,
                left: splashController.animate.value ? 0 : -50,
                child: SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.7,
                  child: Image.asset(splashImage),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: Duration(milliseconds: 1200),
                top: 120,
                right: splashController.animate.value ? 10 : -60,
                child: Column(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.8,
                      child: Image.asset(splashText),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: Duration(milliseconds: 1200),
                // top: 500,
                bottom: splashController.animate.value ? -450 : -600,
                left: 40,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1200),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.8,
                        child: Text(
                          boardingtitle1,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
