import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login/src/constants/colors.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.theme,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final ThemeData theme;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  final dynamic title;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? primaryColor : accentColor;
    return ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: iconColor.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        title: Text(title,
            style: theme.textTheme.headlineMedium?.apply(color: textColor)),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: accentColor.withOpacity(0.1),
                ),
                child: Icon(LineAwesomeIcons.angle_right_solid,
                    size: 18.0, color: Colors.grey))
            : null);
  }
}
