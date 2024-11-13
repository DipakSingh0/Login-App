import 'package:flutter/material.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: formHeight - 10),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              label: Text(fullName),
            ),
          ),
          SizedBox(height: formHeight - 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              label: Text(email),
            ),
          ),
          SizedBox(height: formHeight - 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              label: Text(phoneNo),
            ),
          ),
          SizedBox(height: formHeight - 20),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              label: Text(password),
            ),
          ),
          SizedBox(height: formHeight - 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: Text(signup.toUpperCase())),
          )
        ],
      )),
    );
  }
}
