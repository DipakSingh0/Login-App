import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/src/constants/colors.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/core/screens/profile/update_profile_screen.dart';

import 'user_management_screen.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          title: Text(profilePageTitle, style: theme.textTheme.headlineLarge),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                    isDark ? LineAwesomeIcons.moon : LineAwesomeIcons.sun)),
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
                      child: Icon(LineAwesomeIcons.pencil_alt_solid,
                          size: 18.0, color: Colors.black)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(profileHeading, style: theme.textTheme.headlineMedium),
            Text(profileSubHeading, style: theme.textTheme.headlineSmall),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => UpdateProfileScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text(editProfile, style: TextStyle(color: darkColor))),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            ProfileMenuWidget(
                title: "Settings",
                theme: theme,
                icon: LineAwesomeIcons.cog_solid,
                onPress: () {}),
            ProfileMenuWidget(
                title: "Billing Detail",
                theme: theme,
                icon: LineAwesomeIcons.wallet_solid,
                onPress: () {}),
            ProfileMenuWidget(
                title: "User Management",
                theme: theme,
                icon: LineAwesomeIcons.user_check_solid,
                onPress: () {
                  Get.to(() => UserManagementScreen());
                }),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            ProfileMenuWidget(
                title: "Information",
                theme: theme,
                icon: LineAwesomeIcons.info_solid,
                onPress: () {}),
            ProfileMenuWidget(
                title: "LogOut",
                theme: theme,
                icon: LineAwesomeIcons.sign_in_alt_solid,
                endIcon: false,
                onPress: () {}),
          ],
        ),
      )
    ),
    );
  }
}
