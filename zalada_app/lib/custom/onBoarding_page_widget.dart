import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../MVC/model/onBoarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.45,
          ),
          Column(
            children: [
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'plusjakarta',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).hintColor,
                    fontSize: 25),
              ).pOnly(bottom: 10),
              // style: Theme.of(context).textTheme.headline3,

              Text(
                model.subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'plusjakarta',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).disabledColor,
                    fontSize: 16),
              ).pOnly(bottom: screenHeight * 0.04).px(2),
            ],
          ),
          const SizedBox(
            height: 80.0,
          ),
          // Text(
          //   model.counterText,
          //   style: Theme.of(context).textTheme.headline6,
          // ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
