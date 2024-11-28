import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/src/constants/colors.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(LineAwesomeIcons.angle_left_solid)),
            title: Text(profileHeading, style: theme.textTheme.headlineLarge),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                      isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon)),
            ]),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(defaultPading),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage(profileImage),
                              ),
                            )),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: primaryColor,
                              ),
                              child: Icon(LineAwesomeIcons.camera_solid,
                                  size: 18.0, color: Colors.black)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    Column(
                      children: [
                        TextFormField(
                          // controller: controller.fullName,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            label: Text(fullName),
                          ),
                        ),
                        const SizedBox(height: formHeight - 20),
                        TextFormField(
                          // controller: controller.email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            label: Text(email),
                          ),
                        ),
                        const SizedBox(height: formHeight - 20),
                        TextFormField(
                          // controller: controller.phoneNo,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            label: Text(phoneNo),
                          ),
                        ),
                        const SizedBox(height: formHeight - 20),
                        TextFormField(
                          // controller: controller.password,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            label: Text(password),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: formHeight),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => UpdateProfileScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: Text(editProfile,
                              style: TextStyle(color: darkColor))),
                    ),
                    const SizedBox(height: formHeight),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: joinedAt,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                              children: [
                                TextSpan(
                                  text: joinedAt,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ]),
                        ),
                        ElevatedButton(
                          onPressed: () {}, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                            elevation: 0 , 
                            foregroundColor: Colors.red , 
                            shape: const StadiumBorder() , 
                            side: BorderSide.none , 
                          ),
                          child: const Text(delete)),
                      ],
                    )
                  ],
                ))));
  }
}
