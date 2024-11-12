import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/on_boarding_controller.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final obController = OnBoardingController() ; 
    
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            liquidController: obController.controller,
            slideIconWidget: Icon(Icons.arrow_back_ios_new_rounded),
            enableSideReveal: true,
            onPageChangeCallback: obController.onPageChangeCallback,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
                onPressed: () => obController.animateToNextSlide() , 
                // style: Theme.of(context).elevatedButtonTheme.style,
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color(0xff272727), shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward_ios),
                )),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
                onPressed: () =>  obController.skip() ,
                child: Text("Skip", style: TextStyle(color: Colors.grey[800]))),
          ),
          Obx(() =>
            Positioned(bottom: 25,
                child: AnimatedSmoothIndicator(
                    activeIndex: obController.currentPage.value,
                    count: 3,
                     effect: const WormEffect(
                      activeDotColor: Color(0xff272727),
                      dotHeight: 5.0,
                    ))),
          ),
        ],
      ),
    );
  }

 
}
