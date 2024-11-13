import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:login/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:login/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    // initializing the animation using controller
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FadeInAnimation(
              durationMs: 1200,
              animatePosition: AnimatePosition(
                topAfter: 0,
                topBefore: -40,
                leftBefore: -30,
                leftAfter: 0,
              ),
              child: SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.7,
                child: Image.asset(splashImage),
              ),
            ),
            FadeInAnimation(
                durationMs: 1600,
                animatePosition: AnimatePosition(
                  topAfter: 120,
                  topBefore: 120,
                  rightBefore: -60,
                  rightAfter: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.8,
                      child: Image.asset(splashText),
                    ),
                  ],
                )),
            FadeInAnimation(
              durationMs: 1200,
              animatePosition: AnimatePosition(
                bottomBefore: -600,
                bottomAfter: -450,
                leftBefore: 40,
                leftAfter: 40,
              ),
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
          ],
        ),
      ),
    );
  }
}
