import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/controller/product_controller.dart';
import 'package:zalada_app/custom/product_card.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/MVC/views/notification_screen.dart';
import 'package:zalada_app/MVC/views/product_detail.dart';
import '../../custom/all_custom_btn.dart';
import '../../custom/hot_deal_productcard.dart';
import '../../custom/search_screen_widgets/categories_btn.dart';

class Home_Screen extends StatelessWidget {
  Home_Screen({Key? key}) : super(key: key);
  final controller = Get.put(product_Controller());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: RefreshIndicator(
          color: Theme.of(context).primaryColor,
          onRefresh: () async {},
          child: CustomScrollView(
            
              physics: const BouncingScrollPhysics(),
              primary: true,
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
                    Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context)
                              .highlightColor
                              .withOpacity(0.3)),
                      child: Image.asset('assets/images/cart.png'),
                    ),
                    Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context)
                              .highlightColor
                              .withOpacity(0.3)),
                      child: Image.asset('assets/images/favorite.png'),
                    ),
                    InkWell(
                      onTap: () {
                        Page_Navigation.getInstance
                            .Page(context, Notification_Screen());
                      },
                      child: Container(
                        margin: EdgeInsets.all(7),
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
                        padding: EdgeInsets.only(top: 120, right: 20, left: 20),
                        decoration: BoxDecoration(
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
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          width: size.width,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(237, 101, 101, 101)
                                      .withOpacity(0.20),
                                  blurRadius: 6.0, // soften the shadow
                                  spreadRadius: 0.0, //extend the shadow
                                  offset: Offset(
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
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(0.6),
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
                        style: TextStyle(
                            fontFamily: 'plusjakarta',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ).py(15),
                      Row(
                        children: [Hot_deal_Product_Card()],
                      ).py(20),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            all_custom_btn(),
                            categories_btn(
                              label: 'laptop',
                              selected: false,
                              preffixIcon: Icon(
                                Icons.laptop_windows_outlined,
                                color: Theme.of(context).hintColor,
                                size: 15,
                              ),
                            ),
                            categories_btn(
                              label: 'laptop',
                              selected: false,
                              preffixIcon: Icon(
                                Icons.laptop_windows_outlined,
                                color: Theme.of(context).hintColor,
                                size: 15,
                              ),
                            ),
                            categories_btn(
                              label: 'laptop',
                              selected: false,
                              preffixIcon: Icon(
                                Icons.laptop_windows_outlined,
                                color: Theme.of(context).hintColor,
                                size: 15,
                              ),
                            ),
                            categories_btn(
                              label: 'laptop',
                              selected: false,
                              preffixIcon: Icon(
                                Icons.laptop_windows_outlined,
                                color: Theme.of(context).hintColor,
                                size: 15,
                              ),
                            ),
                            categories_btn(
                              label: 'laptop',
                              selected: false,
                              preffixIcon: Icon(
                                Icons.laptop_windows_outlined,
                                color: Theme.of(context).hintColor,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ).pOnly(bottom: 30),
                      Obx(() => controller.Productslist.isNotEmpty
                          ? MasonryGridView.count(
                              primary: false,
                              shrinkWrap: true,
                              crossAxisCount:
                                  MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? 2
                                      : 4,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              itemCount: controller.Productslist.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = controller.Productslist[index];
                                return Product_Card(
                                  ontap: () {
                                    {
                                      Page_Navigation().Page(
                                          context,
                                          Product_Detail_Screen(
                                            id: item.id,
                                          ));
                                    }
                                  },
                                  imageurl: item.images[0],
                                  product_name: item.name,
                                  price: '\$' + item.price,
                                  status: "NEW ARRIVAL",
                                );
                              },
                              mainAxisSpacing: 50.0,
                              crossAxisSpacing: 15.0,
                            )
                          : Center(
                              child: Text('no Product'),
                            )),
                    ],
                  ),
                ))
              ]),
        ),
      ),
    );
  }
}
