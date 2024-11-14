

import 'package:flutter/material.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.cardColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Icon(
                        Icons.bookmark,
                        color: theme.iconTheme.color,
                      ),
                    ),
                    Flexible(
                        child: Image(
                      image: AssetImage(classic1),
                      height: 50,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "$dashboardBannerTitle1 for aesthetics",
                  style: theme.textTheme.displayMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "4 car Models available",
                  style: theme.textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: Text(dashboardButton)))
              ],
            ),
          ),
        ),
        const SizedBox(
          width: dashboardCardPadding,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.cardColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Icon(
                            Icons.bookmark,
                            color: theme.iconTheme.color,
                          ),
                        ),
                        Flexible(
                            child: Image(
                          image: AssetImage(buggati1),
                          height: 50,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "$dashboardBannerTitle2 for Sports lovers",
                      style: theme.textTheme.displayMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "6 car Models available",
                      style: theme.textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () {}, child: Text(dashboardButton)))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
