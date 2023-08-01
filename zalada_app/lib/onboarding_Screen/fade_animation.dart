import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child, {AssetImage? image});

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 200.0), // 100.0 to 200.0
      duration: const Duration(seconds: 1), // for 1 second
      curve: Curves.bounceOut,
      builder: (context, value, child) {
        return Container(
          width: value, // use animated value
          height: value,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/OTP.png'))),
          child: child,
        );
      },
    );
    // final tween = MultiTween<AniProps>()
    //   ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0),
    //       Duration(milliseconds: 500))
    //   ..add(AniProps.translateY, Tween(begin: -30.0, end: 0.0),
    //       Duration(milliseconds: 500), Curves.easeOut);

    // return PlayAnimation<MultiTweenValues<AniProps>>(
    //   delay: Duration(milliseconds: (500 * delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builder: (context, child, value) => Opacity(
    //     opacity: value.get(AniProps.opacity),
    //     child: Transform.translate(
    //         offset: Offset(0, value.get(AniProps.translateY)), child: child),
    //   ),
    // );
  }
}
