import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:login/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class FadeInAnimation extends StatelessWidget {
  FadeInAnimation({
    super.key,
    required this.durationMs,
    required this.child, //from model
    this.animatePosition, 
  });

  final controller = Get.put(FadeInAnimationController());
  final int durationMs;
  final AnimatePosition? animatePosition; //nullable
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationMs),
        //using splashcontroller.animate.value for animation
        top: controller.animate.value
            ? animatePosition!.topAfter
            : animatePosition!.topBefore,
        left: controller.animate.value
            ? animatePosition!.leftAfter
            : animatePosition!.leftBefore,
        bottom: controller.animate.value
            ? animatePosition!.bottomAfter
            : animatePosition!.bottomBefore,
        right: controller.animate.value
            ? animatePosition!.rightAfter
            : animatePosition!.rightBefore,

        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationMs),
          opacity: controller.animate.value ? 1 : 0,
          child: child,
          // child: Image.asset(splashImage),
        ),
      ),
    );
  }
}
