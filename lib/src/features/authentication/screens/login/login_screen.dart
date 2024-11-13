import 'package:flutter/material.dart';
import 'package:login/src/common_widgets/fade_in_animation/form/form_header_widget.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'widgets/login_footer_widget.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultPading),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeaderWidget(
                  image: loginScreenImage,
                  title: loginTitle,
                  subTitle: loginSubTitle),
              LoginForm(),
              LoginFooterWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
