import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/text_strings.dart';
import 'package:login/src/features/core/screens/profile/profile_screen.dart';

class DashboardAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DashboardAppBarWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.menu,
        color: theme.iconTheme.color,
      ),
      title: Text(
        appName,
        style: theme.textTheme.headlineLarge,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      actions: [
        Container(
            margin: EdgeInsets.only(right: 20, top: 7),
            child: IconButton(
                onPressed: () {
                  Get.to(ProfileScreen());
                },
                icon: Image(
                  image: AssetImage(userProfileImage),
                  color: theme.iconTheme.color,
                )))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(65);
}
