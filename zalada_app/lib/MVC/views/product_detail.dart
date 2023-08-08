import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/home_controller.dart';
import 'package:zalada_app/MVC/views/wishlist_cart_screen.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:readmore/readmore.dart';
import 'package:zalada_app/custom/custom_appbar.dart';
import 'package:zalada_app/custom/product_card.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import '../../custom/add_to_cart_button.dart';
import '../../custom/botton_widget.dart';
import '../controller/cart_controller.dart';
import 'Address_Screen.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:badges/badges.dart' as badges;

class Product_Detail_Screen extends StatelessWidget {
  final int id;

  Product_Detail_Screen({required this.id});
  final controller = Get.put(home_Controller());
  final cartController = Get.put(cart_Controller());
  final groupcontroller = SingleValueDropDownController();
  @override
  Widget build(BuildContext context) {
    final RxString displayimages = ''.obs;
    final hieght = MediaQuery.of(context).size.height;
    final ph = 20.0;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_Appbar(
        leadingButton: back_button(ontap: () {
          Get.back();
        }),
        actionButtons: [
          back_button(
            ontap: () {
              Page_Navigation.getInstance.Page(context, Wishlist_Screen());
            },
            icon_widget: Image.asset(
              'assets/images/favorite.png',
              color: Theme.of(context).hintColor,
            ).p(5),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children:
              controller.productslist.where((p0) => p0.id == id).map((item) {
            displayimages.value = item.product_media[0];
            return Wrap(
              // alignment: WrapAlignment.center,
              children: [
                Text(
                  item.name,
                  // 'Macbook Pro 15" 2019 -Intel Corei7',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 47,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.bold),
                ).pOnly(bottom: 10).px(ph),
                Row(
                  children: [
                    SizedBox(
                      height: hieght / 3,
                      child: SingleChildScrollView(
                        child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: item.product_media.map((img) {
                                  return GestureDetector(
                                    onTap: () {
                                      displayimages.value = img;
                                    },
                                    child: Container(
                                      height: hieght / 12,
                                      width: width / 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Theme.of(context)
                                              .highlightColor
                                              .withOpacity(0.3)),
                                      child: Image.network(img),

                                      //  Image.asset(
                                      //   img != null
                                      //       ? img
                                      //       : 'assets/images/default.png',
                                      //   height: hieght / 15,
                                      //   width: width / 12,
                                      // ),
                                    ).pOnly(bottom: 10),
                                  );
                                }).toList())
                            .pOnly(right: 50),
                      ),
                    ),
                    Obx(() => display_images(
                          width: width,
                          hieght: hieght,
                          img: displayimages.value,
                        ))
                  ],
                ).px(ph),
                // Text(
                //   'Memory',
                //   style: TextStyle(
                //       fontSize: 14,
                //       fontFamily: 'plusjakarta',
                //       fontWeight: FontWeight.w600,
                //       color: Theme.of(context).disabledColor),
                // ).px(15).pOnly(bottom: 10),
                // DropDownTextField(
                //         textFieldDecoration: InputDecoration(
                //             focusedBorder: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   width: 1,
                //                   color: Theme.of(context)
                //                       .disabledColor
                //                       .withOpacity(0.5)),
                //               borderRadius: BorderRadius.circular(10.0),
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   width: 1,
                //                   color: Theme.of(context)
                //                       .disabledColor
                //                       .withOpacity(0.5)),
                //               borderRadius: BorderRadius.circular(10.0),
                //             ),
                //             hintText: item.memory[0] == null
                //                 ? 'Select Stroge'
                //                 : item.memory[0].toString()),
                //         controller: groupcontroller,
                //         dropDownList: item.memory.map((e) {
                //           return DropDownValueModel(
                //               name: e.toString(), value: e.toString());
                //         }).toList())
                //     .px(15),
                // Text(
                //   'Storage',
                //   style: TextStyle(
                //       fontSize: 14,
                //       fontFamily: 'plusjakarta',
                //       fontWeight: FontWeight.w600,
                //       color: Theme.of(context).disabledColor),
                // ).px(15).py(10),
                // DropDownTextField(
                //         textFieldDecoration: InputDecoration(
                //             focusedBorder: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   width: 1,
                //                   color: Theme.of(context)
                //                       .disabledColor
                //                       .withOpacity(0.5)), //<-- SEE HERE
                //               borderRadius: BorderRadius.circular(10.0),
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   width: 1,
                //                   color: Theme.of(context)
                //                       .disabledColor
                //                       .withOpacity(0.5)), //<-- SEE HERE
                //               borderRadius: BorderRadius.circular(10.0),
                //             ),
                //             hintText: item.storage[0] == null
                //                 ? 'Select Stroge'
                //                 : item.storage[0].toString()),
                //         controller: groupcontroller,
                //         dropDownList: item.storage.map((e) {
                //           return DropDownValueModel(
                //               name: e.toString(), value: e.toString());
                //         }).toList())
                //     .px(15),
                SizedBox(height: 80),
                Divider(
                  color: Theme.of(context).disabledColor.withOpacity(0.4),
                  thickness: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'product_descritpion'.tr,
                      style: const TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ).pOnly(bottom: 10),
                    ReadMoreText(
                      item.description,
                      trimLines: 3,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'read_more'.tr,
                      trimExpandedText: 'read_less'.tr,
                      style: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).disabledColor),
                      moreStyle: TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).focusColor),
                    ),
                  ],
                ).px(ph).py(10),
                Divider(
                  color: Theme.of(context).disabledColor.withOpacity(0.4),
                  thickness: 4,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'product_related'.tr,
                    style: const TextStyle(
                        fontFamily: 'plusjakarta',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ).pOnly(bottom: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: controller.productslist
                            .where((p0) => p0.category_id == item.category_id)
                            .map((PR_item) {
                      print(PR_item.category_id);
                      return Product_Card(
                        hotdeal: '',
                        id: PR_item.id,
                        imageurl: PR_item.product_media[0],
                        product_name: PR_item.name,
                        price: '\$' + PR_item.price,
                      ).py(25).px(5);
                    }).toList()),
                  )
                ]).px(ph).py(10)
              ],
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.white70.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(1.0, 1.0), // soften the shadow
                spreadRadius: 0.0, //extend the shadow
              ),
            ],
            border: Border.all(color: Colors.black.withOpacity(0.05)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          children: [
            Obx(
              () => badges.Badge(
                position: badges.BadgePosition.topEnd(top: 3, end: 10),
                showBadge: true,
                badgeContent: Text(
                  cartController.cartproductlist.length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'plusjakarta',
                  ),
                ),
                ignorePointer: false,
                child:

                    //  from here onwords
                    add_to_cart_button(
                  ontap: () {
                    cartController.addProduct(controller.productslist
                        .firstWhere((product) => product.id == id));
                  },
                  pic: Image.asset(
                    'assets/images/cart.png',
                    color: Theme.of(context).hintColor,
                  ).p(15),
                ),
//  end the button, new component comes here.
              ),
            ),
            // back_button(
            //   // ontap: () {
            //   //   cartController.addProduct(Product_Model.dummyProducts[id]);
            //   // },
            //   ontap: () {
            //     cartController.addProduct(controller.Productslist.firstWhere(
            //         (product) => product.id == id));
            //   },

            //   pic: Image.asset(
            //     'assets/images/cart.png',
            //     color: Theme.of(context).hintColor,
            //   ).p(15),
            // ),
            Button_Widget(
                    ontap: () {
                      Page_Navigation.getInstance
                          .Page(context, Address_Screen());
                    },
                    width: width / 1.5,
                    title: 'Checkout')
                .py(11)
          ],
        ),
      ),
    );
  }
}

class display_images extends StatelessWidget {
  const display_images({
    super.key,
    required this.img,
    required this.width,
    required this.hieght,
  });
  final String img;
  final double width;
  final double hieght;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 1.7,
      height: hieght / 2.7,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img)
              // AssetImage(img != null ? img : 'assets/images/default.png')
              )),
    );
  }
}
