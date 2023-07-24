import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

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
                  // title: Text(
                  //   'beauty_salon'.tr,
                  //   style: TextStyle(color: Theme.of(context).primaryColor),
                  // ),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 110),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Theme.of(context).focusColor,
                                Theme.of(context).disabledColor,
                                // Colors.indigo
                              ],
                              // begin: AlignmentDirectional.topCenter,
                              // end: AlignmentDirectional.bottomCenter,
                              stops: [
                                0.1,
                                0.7
                              ],
                              tileMode: TileMode.clamp),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                        ),
                        child: Text(
                          'home_card_description'.tr,
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      )).marginOnly(bottom: 25),
                  // leading: IconButton(
                  //   onPressed: () {
                  //     Scaffold.of(context).openDrawer();
                  //   },
                  //   icon: Icon(
                  //     Icons.sort,
                  //     color: Theme.of(context).primaryColor,
                  //   ),
                  // ),
                  // actions: [notificationButtonWidget()],
                  // flexibleSpace: FlexibleSpaceBar(
                  //   collapseMode: CollapseMode.parallax,
                  //   background: HomePageSlider(),
                  // )
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
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.search,
                                color: Theme.of(context).hintColor,
                              ).pOnly(right: 12),
                              Text(
                                "search_product".tr,
                                style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
                SliverToBoxAdapter(
                    child: Wrap(
                  children: [],
                ))
              ]),
        ),
      ),
    );
  }
}
