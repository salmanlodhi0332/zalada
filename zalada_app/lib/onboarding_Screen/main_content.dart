import 'package:flutter/material.dart';
import 'fade_animation.dart';
import 'onboard_model.dart';

class MainContent extends StatelessWidget {
  MainContent({
    Key? key,
    required this.index,
    required this.list,
  });
  // : _list = list,
  // super(key: key);

  final List<OnboardingModel> list;
  final index;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: FadeAnimation(
              0.5,
              Image.asset(
                list[index].image,
                height: 500,
                width: 500,
              ),
            ),
          ),
          FadeAnimation(
            0.9,
            Text(
              list[index].title,
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w500,
                  fontSize: 26),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          FadeAnimation(
            1.1,
            Text(
              list[index].text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
