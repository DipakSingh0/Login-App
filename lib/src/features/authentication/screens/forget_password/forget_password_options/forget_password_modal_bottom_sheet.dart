import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/authentication/screens/forget_password/forget_password_email/forget_password_email.dart';
import 'package:login/src/features/authentication/screens/forget_password/forget_password_options/forget_password_button_widget.dart';

class ForgetPaswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) => Container(
              padding: EdgeInsets.all(defaultPading),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    forgetPasswordTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ForgetPasswordButtonWidget(
                    onTap: () { 
                      Navigator.pop(context); 
                      Get.to(() =>  ForgetPasswordEmailScreen());
                    },
                    buttonIcon: Icons.email_outlined,
                    title: email,
                    subtitle: resetViaEmail,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ForgetPasswordButtonWidget(
                    onTap: () {},
                    buttonIcon: Icons.phone,
                    title: phoneNo,
                    subtitle: resetViaPhone,
                  ),
                ],
              ),
            ));
  }
}