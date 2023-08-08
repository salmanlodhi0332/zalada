import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/product_controller.dart';
import 'package:zalada_app/custom/image_widget.dart';
import 'package:zalada_app/custom/product_card.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zalada_app/utiles/loader.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/MVC/views/notification_screen.dart';
import 'package:zalada_app/MVC/views/product_detail.dart';
import '../../custom/add_to_cart_button.dart';
import '../../custom/all_custom_btn.dart';
import '../../custom/search_screen_widgets/categories_btn.dart';
import 'package:badges/badges.dart' as badges;

import '../controller/cart_controller.dart';
import '../controller/home_controller.dart';
import 'cart_screen.dart';

class Home_Screen extends StatefulWidget {
  Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final Homecontroller = Get.put(home_Controller());

  final controller = Get.put(product_Controller());
  final cartController = Get.put(cart_Controller());

  RxInt selectedCategories = 0.obs;

  ScrollController _scrollController = ScrollController();

  bool _isLoadingMore = false;
  int pageNo = 1;
  @override
  void initState() {
    super.initState();
    controller.getAllproducts(0, pageNo, context);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!_isLoadingMore) {
        setState(() {
          _isLoadingMore = true;
        });
        pageNo++;
        controller.getAllproducts(0, pageNo, context).then((_) {
          setState(() {
            _isLoadingMore = false;
          });
        });
      }
    }
  }

  Widget _buildLoaderWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh: () async {
          Homecontroller.onInit();
          // controller.getAllproducts(pageNo);
        },
        child: CustomScrollView(
            controller: _scrollController,
            shrinkWrap: false,
            clipBehavior: Clip.none,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 300,
                elevation: 0,
                clipBehavior: Clip.none,
                floating: true,
                pinned: false,
                automaticallyImplyLeading: false,
                actions: [
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
                      child: Container(
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Theme.of(context)
                                .highlightColor
                                .withOpacity(0.3)),
                        child: add_to_cart_button(
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cart_Screen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:
                            Theme.of(context).highlightColor.withOpacity(0.3)),
                    child: Image.asset('assets/images/favorite.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Page_Navigation.getInstance
                          .Page(context, Notification_Screen());
                    },
                    child: Container(
                      margin: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context)
                              .highlightColor
                              .withOpacity(0.3)),
                      child: Image.asset('assets/images/notification.png'),
                    ),
                  ),
                ],
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('assets/images/default.png'),
                ).p(8),
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(top: 120, right: 20, left: 20),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/Bg.png',
                              ),
                              fit: BoxFit.cover)),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text(
                            'home_card_description'.tr,
                            style: TextStyle(
                                fontFamily: 'plusjakarta',
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                          ),
                          Positioned(
                            top: -20,
                            left: size.width / 1.5,
                            // bottom: 10,
                            child: Image.asset(
                              'assets/images/img.png',
                            ),
                          ),
                        ],
                      ),
                    )).marginOnly(bottom: 30),
                bottom: PreferredSize(
                    preferredSize: Size(size.width, 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 55,
                        width: size.width,
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(237, 101, 101, 101)
                                    .withOpacity(0.20),
                                blurRadius: 6.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: const Offset(
                                  1.0, // Move to right 10  horizontally
                                  1.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            color: Theme.of(context).cardColor,
                            // border: Border.all(
                            //   color: ,
                            // ),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.search,
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.6),
                            ).pOnly(right: 12),
                            Text(
                              "search_product".tr,
                              style: TextStyle(
                                  fontFamily: 'plusjakarta',
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  children: [
                    Text(
                      'hot_deal'.tr,
                      style: const TextStyle(
                          fontFamily: 'plusjakarta',
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ).pOnly(top: 10),
                    const Row(
                      children: [
                        Product_Card(
                          id: 1,
                          hotdeal: 'true',
                          imageurl:
                              'https://firebasestorage.googleapis.com/v0/b/salmantest-ee1a4.appspot.com/o/p4.png?alt=media&token=5c2529c2-18ca-4c21-baac-8548793b2107',
                          product_name: "Sample Product 5",
                          price: '\$' + "502.99",
                          status: "NEW ARRIVAL",
                        )
                      ],
                    ).py(20),
                    Obx(
                      () => SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // children: catename.map((e) => categories_btn(label:  , selected: selected)).toList(),
                          children: [
                            const all_custom_btn(),
                            Row(
                              children: Homecontroller.categoriesList
                                  .map((e) => Obx(() => GestureDetector(
                                            onTap: () {
                                              selectedCategories.value = e.id;
                                              print('Category_Id');
                                              print(selectedCategories.value);
                                              controller.getAllproducts(
                                                  e.id, pageNo, context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .cardColor,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                    color: selectedCategories
                                                                .value ==
                                                            e.id
                                                        ? Theme.of(context)
                                                            .indicatorColor
                                                            .withOpacity(0.5)
                                                        : Theme.of(context)
                                                            .disabledColor
                                                            .withOpacity(0.3),
                                                  )),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                          backgroundColor: Theme
                                                                  .of(context)
                                                              .highlightColor,
                                                          radius: 15,
                                                          child: image_widget(
                                                              imageUrl: e
                                                                  .Categoriesimage))
                                                      .pOnly(right: 3),
                                                  Text(
                                                    e.name,
                                                    style: TextStyle(
                                                      fontFamily: 'plusjakarta',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                    ),
                                                  )
                                                ],
                                              ).px(5).py(2),
                                            ).px(5),
                                          ))
                                      //  categories_btn(
                                      //     label: e.name,
                                      //     preffixIcon: image_widget(
                                      //         imageUrl: e.Categoriesimage)),
                                      )
                                  .toList(),
                            )
                          ],
                        ),
                      ).pOnly(bottom: 10),
                    ),
                    Obx(() => controller.productslist.isNotEmpty
                        ? MasonryGridView.count(
                            primary: false,
                            shrinkWrap: true,
                            crossAxisCount:
                                MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 2
                                    : 4,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemCount: controller.productslist.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = controller.productslist[index];
                              return Product_Card(
                                id: item.id,
                                ontap: () {
                                  {
                                    Page_Navigation.getInstance.Page(
                                        context,
                                        Product_Detail_Screen(
                                          id: item.id,
                                        ));
                                  }
                                },
                                hotdeal: 'false',
                                imageurl: item.images[0],
                                product_name: item.name,
                                price: '\$' + item.price,
                                status: "NEW ARRIVAL",
                              );
                            },
                            mainAxisSpacing: 50.0,
                            crossAxisSpacing: 15.0,
                          )
                        : const Center(
                            child: Text('no Product'),
                          )),
                    _isLoadingMore ? _buildLoaderWidget() : SizedBox.shrink(),
                  ],
                ),
              ))
            ]),
      ),
    );
  }
}
