import 'package:flutter/material.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
          backgroundColor: theme.appBarTheme.backgroundColor,
          actions: [
            Container(
                margin: EdgeInsets.only(right: 20, top: 7),
                child: IconButton(
                    onPressed: () {},
                    icon: Image(
                      image: AssetImage(userProfileImage),
                      color: theme.iconTheme.color,
                    )))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(dashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dashboardTitle,
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  dashboardHeading,
                  style: theme.textTheme.displayLarge,
                ),
                const SizedBox(
                  height: dashboardPadding,
                ),

                // -----------SearchBox---------//
                Container(
                  decoration: const BoxDecoration(
                      border: Border(left: BorderSide(width: 4))),
                    padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(dashboardSearch,
                          style: theme.textTheme.displayLarge
                              ?.apply(color: Colors.grey.withOpacity(0.5))
                              ),
                      Icon(Icons.mic , size: 25,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
