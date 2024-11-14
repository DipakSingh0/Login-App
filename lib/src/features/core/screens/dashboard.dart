import 'package:flutter/material.dart';
import 'package:login/src/constants/sizes.dart';
import 'package:login/src/constants/text_strings.dart';
import 'dashboard/widgets/appbar.dart';
import 'dashboard/widgets/banners.dart';
import 'dashboard/widgets/cards.dart';
import 'dashboard/widgets/categories.dart';
import 'dashboard/widgets/search.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBarWidget(theme: theme),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(dashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //-----------------------Heading --------------------//

                Text(
                  dashboardTitle,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  dashboardHeading,
                  style: theme.textTheme.displayLarge,
                ),
                const SizedBox(
                  height: dashboardPadding,
                ),

                // -----------SearchBox---------//
                SearchBoxWidget(theme: theme),

                SizedBox(
                  height: 20,
                ),

                //-----------categories-------------//
                CategoriesWidget(theme: theme),

                SizedBox(
                  height: 20,
                ),

                //--------------banners----........//

                BannersWidget(theme: theme),

                SizedBox(
                  height: 20,
                ),

                Text(
                  dashboardTopBrands,
                  style:
                      theme.textTheme.displayLarge?.apply(fontSizeFactor: 1.2),
                ),

                //----------------card-------------------//

                CardsWidget(theme: theme)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
