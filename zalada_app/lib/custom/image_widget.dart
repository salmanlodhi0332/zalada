import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class image_widget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  const image_widget({required this.imageUrl, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty
        ? Image.asset(
            'assets/images/photo.png',
            height: height,
            width: width,
            fit: BoxFit.fill,
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            width: width,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SpinKitFadingCircle(
                      color: Theme.of(context).primaryColor,
                      size: 50.0,
                      duration: Duration(seconds: 2),
                    ),
                  ),
                ),
            errorWidget: (context, url, error) => Image.asset(
                  'assets/images/photo.png',
                  height: height,
                  width: width,
                  fit: BoxFit.fill,
                ));
  }
}
