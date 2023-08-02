import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class custom_shimmer extends StatelessWidget {
  const custom_shimmer({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).hintColor.withOpacity(0.1),
      highlightColor: Theme.of(context).hintColor.withOpacity(0.2),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Theme.of(context).hintColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
