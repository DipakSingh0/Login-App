import 'package:flutter/material.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(loginScreenImage),
          height: size.height * 0.24,
        ),
        Text(
          loginTitle,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: formHeight - 25,),
        Text(
          loginSubTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
