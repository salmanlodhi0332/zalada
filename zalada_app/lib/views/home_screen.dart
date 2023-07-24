import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/custom/product_card.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../custom/hot_deal_productcard.dart';

class Home_Screen extends StatelessWidget {
  Home_Screen({Key? key}) : super(key: key);

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
                  pinned: false,
                  expandedHeight: 300,
                  elevation: 0,
                  clipBehavior: Clip.none,
                  floating: true,
                  centerTitle: true,
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
                    Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context)
                              .highlightColor
                              .withOpacity(0.3)),
                      child: Image.asset('assets/images/notification.png'),
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
                        padding: EdgeInsets.only(top: 110, right: 20, left: 20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/Bg.png',
                                ),
                                fit: BoxFit.fitWidth)),
                        child: Text(
                          'home_card_description'.tr,
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                      )).marginOnly(bottom: 25),
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
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ).py(15),
                      Row(
                        children: [Hot_deal_Product_Card()],
                      ).py(20),
                      Row(
                        children: [],
                      ).py(20),
                      MasonryGridView.count(
                        primary: false,
                        shrinkWrap: true,
                        crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 2
                            : 4,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Product_Card(
                            imageurl: 'assets/images/success.png',
                            product_name: 'Macbook Pro 15" 2019 -Intel corei7',
                            price: '\$1240',
                            status: "NEW ARRIVAL",
                          );
                        },
                        mainAxisSpacing: 50.0,
                        crossAxisSpacing: 15.0,
                      ),
                    ],
                  ),
                ))
              ]),
        ),
      ),
    );
  }
}
