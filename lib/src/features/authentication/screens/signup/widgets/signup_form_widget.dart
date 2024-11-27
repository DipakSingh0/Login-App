import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/authentication/controllers/signup_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    //defineing controller signup
    final controller = Get.put(SignUpController());
    final _formKey  = GlobalKey<FormState>();

    return Container(
      padding: EdgeInsets.symmetric(vertical: formHeight - 10),
      child: Form(
        key: _formKey,  //ky must be unique
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.fullName,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              label: Text(fullName),
            ),
          ),
          SizedBox(height: formHeight - 20),
          TextFormField(
            controller: controller.email,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              label: Text(email),
            ),
          ),
          SizedBox(height: formHeight - 20),
          TextFormField(
            controller: controller.phoneNo,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              label: Text(phoneNo),
            ),
          ),
          SizedBox(height: formHeight - 20),
          TextFormField(
            controller: controller.password,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              label: Text(password),
            ),
          ),
          SizedBox(height: formHeight - 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    SignUpController.instance.registerUser(
                      controller.email.text.trim(), 
                      controller.password.text.trim(), 
                    // controller.fullName.text.trim(), controller.phoneNo.text.trim()
             ); }
                }, 
                child: Text(signup.toUpperCase())),
          )
        ],
      )),
    );
  }
}
