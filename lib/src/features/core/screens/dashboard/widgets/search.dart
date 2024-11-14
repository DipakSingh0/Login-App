import 'package:flutter/material.dart';
import 'package:login/src/constants/text_strings.dart';

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(border: Border(left: BorderSide(width: 4))),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(dashboardSearch,
              style: theme.textTheme.displayLarge
                  ?.apply(color: Colors.grey.withOpacity(0.5))),
          Icon(
            Icons.mic,
            size: 25,
          ),
        ],
      ),
    );
  }
}
