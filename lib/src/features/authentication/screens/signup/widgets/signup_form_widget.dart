import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/authentication/controllers/signup_controller.dart';
import 'package:login/src/features/authentication/models/user_model.dart';
import 'package:login/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //defineing controller signup
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: EdgeInsets.symmetric(vertical: formHeight - 10),
      child: Form(
          key: _formKey, //ky must be unique
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
                      if (_formKey.currentState!.validate()) {
                        // Email and password authentication
                        // SignUpController.instance.registerUser(
                        //   controller.email.text.trim(),
                        //   controller.password.text.trim(),
                        // );

                        // phone authenticatoini
                        // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());

                        /*
                        step 3  - Get user and pass it to controler
                        */

                        final user = UserModel(
                          email: controller.email.text.trim(),
                          password: controller.password.text.trim(),
                          fullName: controller.fullName.text.trim(),
                          phoneNo: controller.phoneNo.text.trim(),
                        );
                        SignUpController.instance.createUser(user);

                        Get.to(() => const OtpScreen());
                      }
                    },
                    child: Text(signup.toUpperCase())),
              )
            ],
          )),
    );
  }
}
