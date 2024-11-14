import 'package:flutter/material.dart';
import 'package:login/src/features/core/models/dashboard/categories_model.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list; 
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index) => 
        GestureDetector(
          onTap: list[index].onPress , 
          child: SizedBox(
            width: 170,
            height: 50,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.cardColor,
                  ),
                  child: Center(
                      child: Text(
                    list[index].title,
                    style: theme.textTheme.headlineSmall
                        ?.apply(color: Colors.grey[800]),
                    // style: theme.textTheme.labelLarge,
                  )),
                ),
                SizedBox(
                  width: 5,
                ),
                //-----------
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        list[index].heading,
                        style: theme.textTheme.headlineSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(list[index].subHeading,
                          style: theme.textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // children: [
          
        //   SizedBox(
        //     width: 170,
        //     height: 50,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: theme.cardColor,
        //           ),
        //           child: Center(
        //               child: Text(
        //             "Supra",
        //             style: theme.textTheme.headlineSmall
        //                 ?.apply(color: Colors.grey[800]),
        //             // style: theme.textTheme.labelLarge,
        //           )),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         //-----------
        //         Flexible(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Text(
        //                 "Toyota",
        //                 style: theme.textTheme.headlineSmall,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text("1 Model",
        //                   style: theme.textTheme.bodyLarge,
        //                   overflow: TextOverflow.ellipsis),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        //   SizedBox(
        //     width: 170,
        //     height: 50,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: theme.cardColor,
        //           ),
        //           child: Center(
        //               child: Text(
        //             "BBT",
        //             style: theme.textTheme.headlineSmall
        //                 ?.apply(color: Colors.grey[800]),
        //             // style: theme.textTheme.labelLarge,
        //           )),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         //-----------
        //         Flexible(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Text(
        //                 "Buggati",
        //                 style: theme.textTheme.headlineSmall,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text("4 Models",
        //                   style: theme.textTheme.bodyLarge,
        //                   overflow: TextOverflow.ellipsis),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      
      ),
    );
  }
}
