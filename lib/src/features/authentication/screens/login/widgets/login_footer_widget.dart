import 'package:flutter/material.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('OR'),
        const SizedBox(height: formHeight - 15),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(image: AssetImage(googleLogo), width: 20),
            onPressed: () {},
            label: Text(signInWithGoogle),
          ),
        ),
        const SizedBox(height: formHeight - 20),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
                text: dontHaveAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: <TextSpan>[
                  TextSpan(text: signup, style: TextStyle(color: Colors.blue)),
                ]),
          ),
        )
      ],
    );
  }
}
