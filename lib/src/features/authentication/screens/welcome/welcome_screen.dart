import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/constants/colors.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';

import '../../controllers/splash_screen_controller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  // creating instance of controller
  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    var mediaQuery =MediaQuery.of(context) ; 
    var screenHeight = mediaQuery.size.height;
    // var screenWidth = mediaQuery.size.width;
    var brightness = mediaQuery.platformBrightness ;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor: whiteColor ,
        body: Container(
      padding: EdgeInsets.all(defaultPading),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //  Image(
          //           image: AssetImage(welcomeImage),
          //           height: screenHeight * 0.6,
          //         ),
          SizedBox(height: 20),
          Image(
            image: AssetImage(welcomeImage),
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
                      style: Theme.of(context).outlinedButtonTheme.style,
                      onPressed: () {},
                      child: Text(login.toUpperCase()))),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {},
                      child: Text(signup.toUpperCase())))
            ],
          )
        ],
      ),
    ));
  }
}
