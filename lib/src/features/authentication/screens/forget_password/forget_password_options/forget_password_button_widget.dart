import 'package:flutter/material.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({
    super.key,
    required this.buttonIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData buttonIcon;
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          child: Row(
            children: [
              Icon(buttonIcon, size: 50),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ],
          )),
    );
  }
}
