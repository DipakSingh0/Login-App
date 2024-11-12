import 'package:flutter/material.dart';
import 'package:login/src/constants/text_strings.dart';
import '../../models/on_boarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(30),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image(
                image: AssetImage(
                  model.image,
                ),
                height: size.height * 0.380,
              ),
              Text(
                boardingtitle1,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                boardingsubtitle1,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Text(
            boardingcounter1,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
