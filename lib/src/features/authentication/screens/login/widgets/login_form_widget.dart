import 'package:flutter/material.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: formHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_3_outlined),
                labelText: "email",
                hintText: "email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: formHeight - 5,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: "password",
                hintText: "password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
            SizedBox(
              height: formHeight - 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(forgetPassword,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(login.toUpperCase()),
                ))
          ],
        ),
      ),
    );
  }
}
