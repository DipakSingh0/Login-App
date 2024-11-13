import 'package:flutter/material.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('OR'),
        SizedBox(height: formHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(googleLogo),
              width: 20.0,
            ),
            label: Text(signInWithGoogle.toUpperCase()),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: alreadyHaveAccount,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextSpan(
              text: login.toUpperCase(),
              // style: Theme.of(context).textTheme.bodyMedium,
            ),
          ])),
        ),
      ],
    );
  }
}
