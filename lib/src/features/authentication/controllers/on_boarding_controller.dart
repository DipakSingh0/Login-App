import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:login/src/constants/colors.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/authentication/models/on_boarding_model.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
      image: boardingimage1,
      title: boardingtitle1,
      subTitle: boardingsubtitle1,
      counterText: boardingcounter1,
      bgColor: onBoardingPage1Color,
      // height: size.height
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      image: boardingimage2,
      title: boardingtitle2,
      subTitle: boardingsubtitle2,
      counterText: boardingcounter2,
      bgColor: onBoardingPage2Color,
      // height: size.height
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      image: boardingimage3,
      title: boardingtitle3,
      subTitle: boardingsubtitle3,
      counterText: boardingcounter3,
      bgColor: onBoardingPage3Color,
      // height: size.height
    ))
  ];

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
  onPageChangeCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
}
