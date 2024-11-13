import 'package:flutter/material.dart';
import 'package:login/src/constants/sizes.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(image),
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
          subTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
