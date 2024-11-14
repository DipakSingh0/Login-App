import 'package:flutter/material.dart';
import 'package:login/src/constants/image_strings.dart';
import 'package:login/src/constants/sizes.dart';

class CardsWidget extends StatelessWidget {
  const CardsWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          //----------------buggati-------------------//

          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 10),
            child: SizedBox(
              height: 200,
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  color: theme.cardColor,
                ),
                padding: EdgeInsets.all(dashboardPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top brands row------------//
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Text("Buggati(B-B-T)",
                                    style: theme.textTheme.displayMedium),
                                Text("The Big Boys Choice",
                                    style: theme.textTheme.labelLarge),
                              ],
                            ),
                          ),
                          // SizedBox(width: 15),
                          const Flexible(
                              child: Image(
                            image: AssetImage(buggati1),
                            height: 100,
                          )),
                        ],
                      ),

                      Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              onPressed: () {},
                              child: Icon(Icons.play_arrow)),
                          const SizedBox(
                            width: dashboardCardPadding,
                          ),
                          Column(
                            children: [
                              Text(
                                "4 Brands",
                                style: theme.textTheme.headlineSmall,
                              ),
                              Text(
                                "Cars Pics",
                                style: theme.textTheme.labelLarge,
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
              ),
            ),
          ),

          //----------------Lamborghini-------------------//

          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 10),
            child: SizedBox(
              height: 200,
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  color: theme.cardColor,
                ),
                padding: EdgeInsets.all(dashboardPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top brands row------------//
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Text("Lamborghini",
                                    style: theme.textTheme.displayMedium),
                                Text("The Spectators Choice",
                                    style: theme.textTheme.labelLarge),
                              ],
                            ),
                          ),
                          // SizedBox(width: 15),
                          const Flexible(
                              child: Image(
                            image: AssetImage(lambo1),
                            height: 100,
                          )),
                        ],
                      ),

                      Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              onPressed: () {},
                              child: Icon(Icons.play_arrow)),
                          const SizedBox(
                            width: dashboardCardPadding,
                          ),
                          Column(
                            children: [
                              Text(
                                "4 Brands",
                                style: theme.textTheme.headlineSmall,
                              ),
                              Text(
                                "Cars Pics",
                                style: theme.textTheme.labelLarge,
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
              ),
            ),
          ),

          //---------------- toyota -----------------------.
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 10),
            child: SizedBox(
              height: 200,
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  color: theme.cardColor,
                ),
                padding: EdgeInsets.all(dashboardPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top brands row------------//
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Text("Toyota Supra",
                                    style: theme.textTheme.displayMedium),
                                Text("The Heavenly Choice",
                                    style: theme.textTheme.labelLarge),
                              ],
                            ),
                          ),
                          // SizedBox(width: 15),
                          const Flexible(
                              child: Image(
                            image: AssetImage(supra1),
                            height: 100,
                          )),
                        ],
                      ),

                      Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              onPressed: () {},
                              child: Icon(Icons.play_arrow)),
                          const SizedBox(
                            width: dashboardCardPadding,
                          ),
                          Column(
                            children: [
                              Text(
                                "4 Brands",
                                style: theme.textTheme.headlineSmall,
                              ),
                              Text(
                                "Cars Pics",
                                style: theme.textTheme.labelLarge,
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
