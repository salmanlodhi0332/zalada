import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/home_controller.dart';
import 'package:zalada_app/custom/image_widget.dart';
import 'package:zalada_app/utiles/themeData.dart';

import '../MVC/controller/cart_controller.dart';
import '../MVC/controller/product_controller.dart';

class Wishlist_Card extends StatelessWidget {
  final int id;
  final String imageurl;
  final String product_name;
  final String price;
  final String status;
  final String hotdeal;
  final String? disprice;
  final Function()? ontap;
  const Wishlist_Card(
      {super.key,
      required this.hotdeal,
      required this.id,
      this.disprice,
      required this.imageurl,
      required this.product_name,
      required this.price,
      required this.status,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(home_Controller());
    final cartController = Get.put(cart_Controller());
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        height: height / 4.5,
        width: width / 2.3,
        decoration: AppTheme.getBoxDecoration(context),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                image_widget(
                  imageUrl: imageurl,
                  height: height / 10,
                  width: width / 5,
                ),
                Text(
                  product_name + product_name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: false,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w600),
                ),
                hotdeal == ''
                    ? Text(
                        price,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                            fontFamily: 'plusjakarta',
                            fontSize: 16,
                            color: Theme.of(context).focusColor,
                            fontWeight: FontWeight.bold),
                      ).pOnly(bottom: 15)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: '\$1240',
                              style: TextStyle(
                                  fontFamily: 'plusjakarta',
                                  fontSize: 15,
                                  color: Theme.of(context).focusColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: '\$1540',
                              style: TextStyle(
                                  fontFamily: 'plusjakarta',
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .disabledColor
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.w600),
                            )
                          ])),
                          GestureDetector(
                            onTap: () {
                              if (id != null) {
                                cartController.addProduct(controller
                                    .productslist
                                    .firstWhere((product) => product.id == id));
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).hoverColor),
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                          // SizedBox(
                          //   height: 30,
                          //   width: 30,
                          //   child:
                          //    FloatingActionButton(
                          //     onPressed: () {},
                          //     child: Icon(
                          //       Icons.add,
                          //       size: 15,
                          //     ),
                          //     backgroundColor: Theme.of(context).hoverColor,
                          //   ),
                          // )
                        ],
                      )
              ],
            ),
            hotdeal == ''
                ? status.isNotEmpty
                    ? Positioned(
                        bottom: -10,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Theme.of(context).indicatorColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              status,
                              style: TextStyle(
                                  fontFamily: 'plusjakarta',
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10),
                            )))
                    : SizedBox()
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
