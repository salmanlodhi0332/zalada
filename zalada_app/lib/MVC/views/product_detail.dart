import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/home_controller.dart';
import 'package:zalada_app/MVC/controller/wishlist_controller.dart';
import 'package:zalada_app/MVC/model/product_model.dart';
import 'package:zalada_app/MVC/views/wishlist_cart_screen.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:readmore/readmore.dart';
import 'package:zalada_app/custom/custom_appbar.dart';
import 'package:zalada_app/custom/product_card.dart';
import 'package:zalada_app/service/Api_Service.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import '../../custom/add_to_cart_button.dart';
import '../../custom/botton_widget.dart';
import '../controller/cart_controller.dart';
import 'Address_Screen.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Product_Detail_Screen extends StatefulWidget {
  final int id;

  Product_Detail_Screen({required this.id});

  @override
  State<Product_Detail_Screen> createState() => _Product_Detail_ScreenState();
}

class _Product_Detail_ScreenState extends State<Product_Detail_Screen> {
  final controller = Get.put(home_Controller());

  final cartController = Get.put(cart_Controller());

  final groupcontroller = SingleValueDropDownController();
  RxDouble Rating = 0.0.obs;
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final RxString displayimages = ''.obs;
    final hieght = MediaQuery.of(context).size.height;
    final ph = 20.0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: Custom_Appbar(
        leadingButton: back_button(ontap: () {
          Get.back();
        }),
        actionButtons: [
          back_button(
            ontap: () {
              toggleFavorite();
              ApiService.getInstance.Add_Wishlist(widget.id, context);
              // Page_Navigation.getInstance.Page(context, Wishlist_Screen());
            },
            icon_widget: Image.asset(
              'assets/images/favorite.png',
              color: isFavorite ? Colors.red : Theme.of(context).hintColor,
            ).p(5),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: controller.productslist
                  .where((p0) => p0.id == widget.id)
                  .map((item) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: item.product_media.map((img) {
                                      return GestureDetector(
                                        onTap: () {
                                          displayimages.value = img;
                                        },
                                        child: Container(
                                          height: hieght / 12,
                                          width: size.width / 10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Theme.of(context)
                                                  .highlightColor
                                                  .withOpacity(0.3)),
                                          child: Image.network(
                                            img,
                                          ),
                                        ).pOnly(bottom: 10),
                                      );
                                    }).toList())
                                .pOnly(right: 50),
                          ),
                        ),
                        Obx(() => display_images(
                              width: size.width,
                              hieght: hieght,
                              img: displayimages.value,
                            ))
                      ],
                    ).px(ph),
                    Column(
                      children: item.subsections
                          .map((e) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'plusjakarta',
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).disabledColor),
                                  ).px(15).pOnly(bottom: 10, top: 15),
                                  DropDownTextField(
                                          textFieldDecoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Theme.of(context)
                                                        .disabledColor
                                                        .withOpacity(0.5)),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Theme.of(context)
                                                        .disabledColor
                                                        .withOpacity(0.5)),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              hintText: e.value[0] == null
                                                  ? 'Select Stroge'
                                                  : e.value[0]),
                                          controller: groupcontroller,
                                          dropDownList: e.value.map((p0) {
                                            return DropDownValueModel(
                                                name: p0, value: p0);
                                          }).toList())
                                      .px(15),
                                ],
                              ))
                          .toList(),
                    ).py(15),
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
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                    .where((p0) =>
                                        p0.category_id == item.category_id)
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
            Container(
              child: Column(children: [
                Text(
                  'Rate_this_product'.tr,
                  style: const TextStyle(
                      fontFamily: 'plusjakarta',
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ).pOnly(bottom: 10),
                SizedBox(
                    width: size.width / 1,
                    child: Center(
                      child: RatingBar.builder(
                        initialRating: 2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 219, 111),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                          if (rating != null) {
                            setState(() {
                              Rating.value = rating;
                            });
                          }
                        },
                      ),
                    )).py(20),
                Obx(
                  () => Rating.value > 0.0
                      ? Button_Widget(
                              ontap: () {
                                Page_Navigation.getInstance
                                    .Page(context, Address_Screen());
                              },
                              width: size.width / 2.5,
                              title: 'Add_rating'.tr)
                          .py(20)
                      : SizedBox().py(20),
                ),
              ]),
            )
          ],
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
                // ignorePointer: false,
                child:

                    //  from here onwords
                    add_to_cart_button(
                  ontap: () {
                    var productData = controller.productslist
                        .firstWhere((product) => product.id == widget.id);

                    cartController.addtoCart(productData, context);
                  },
                  pic: Image.asset(
                    'assets/images/cart.png',
                    color: Theme.of(context).hintColor,
                  ).p(15),
                ),
              ),
            ),
            Button_Widget(
                    ontap: () {
                      Page_Navigation.getInstance
                          .Page(context, Address_Screen());
                    },
                    width: size.width / 1.5,
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
