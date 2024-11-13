import 'package:flutter/material.dart';
import 'package:login/src/constants/sizes.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageColor,
    this.imageHeight,
    this.heightBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start, this.textAlign,
  });

  final String image, title, subTitle;
  final Color? imageColor;
  final double? imageHeight ;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          color: imageColor,
          height: size.height * 0.24,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: formHeight - 25,
        ),
        Text(
          subTitle,textAlign: textAlign,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
