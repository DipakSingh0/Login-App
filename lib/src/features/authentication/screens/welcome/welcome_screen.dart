import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:login/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:login/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/authentication/screens/login/login_screen.dart';
import 'package:login/src/features/authentication/screens/signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // creating instance of controller
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    // var brightness = mediaQuery.platformBrightness;
    // final isDarkMode = brightness == Brightness.dark;
    var theme = Theme.of(context);

    return Scaffold(
        // backgroundColor: isDarkMode ? secondaryColor : whiteColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Stack(
          children: [
            FadeInAnimation(
              durationMs: 1600,
              animatePosition: AnimatePosition(
                bottomBefore: -100,
                bottomAfter: 0,
                leftAfter: 0,
                leftBefore: 0,
                topAfter: 0,
                topBefore: 0,
                rightAfter: 0,
                rightBefore: 0,
              ),
              child: Container(
                padding: EdgeInsets.all(defaultPading),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage(welcomeScreenImage),
                      height: screenHeight * 0.4,
                    ),
                    Column(
                      children: [
                        Text(
                          welcomeTitle,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          welcomeSubTitle,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                style:
                                    Theme.of(context).outlinedButtonTheme.style,
                                onPressed: () => Get.to(LoginScreen()),
                                child: Text(login.toUpperCase()))),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () => Get.to(SignupScreen()),
                                child: Text(signup.toUpperCase())))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
