import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/MVC/views/product_detail.dart';
import 'package:zalada_app/MVC/views/search_result_screen.dart';
import 'package:zalada_app/custom/all_custom_btn.dart';
import 'package:zalada_app/custom/back_button.dart';
import 'package:zalada_app/custom/custom_appbar.dart';
import 'package:zalada_app/custom/search_screen_widgets/search_grid.dart';
import '../../custom/product_card.dart';
import '../../custom/search_bar.dart';
import '../../custom/search_screen_widgets/categories_btn.dart';
import '../../utiles/page_navigation.dart';
import '../controller/wishlist_controller.dart';

class Wishlist_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Custom_Appbar(
          title: "your_wishlist".tr,
          leadingButton: back_button(ontap: () {
            Get.back();
          })),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            wishlist_grid(),
          ],
        ),
      ),
    );
  }
}

class wishlist_grid extends StatefulWidget {
  wishlist_grid({super.key});

  @override
  State<wishlist_grid> createState() => _wishlist_gridState();
}

class _wishlist_gridState extends State<wishlist_grid> {
  final controller = Get.put(Wishlist_Controller());

  @override
  void initState() {
    super.initState();
    controller.getAllwishlist();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Obx(() => controller.wishlist.isNotEmpty
          ? MasonryGridView.count(
              primary: false,
              shrinkWrap: true,
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              itemCount: controller.wishlist.length,
              itemBuilder: (BuildContext context, int index) {
                final item = controller.wishlist[index];
                return Product_Card(
                  id: item.id,
                  ontap: () {
                    // {
                    //   Page_Navigation().Page(
                    //       context,
                    //       Product_Detail_Screen(
                    //         id: item.id,
                    //       ));
                    // }
                  },
                  hotdeal: '',
                  imageurl: item.product_media[0],
                  product_name: item.name,
                  price: '\$' + item.price,
                );
              },
              mainAxisSpacing: 50.0,
              crossAxisSpacing: 15.0,
            )
          : Center(
              child: Text('Empty Wishlist'),
            )),
    );
  }
}
