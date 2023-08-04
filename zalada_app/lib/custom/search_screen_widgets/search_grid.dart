import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zalada_app/MVC/controller/product_controller.dart';
import 'package:zalada_app/custom/product_card.dart';

import 'package:zalada_app/MVC/views/product_detail.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class search_grid extends StatelessWidget {
  search_grid({super.key});
  final controller = Get.put(product_Controller());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Obx(() => controller.productslist.isNotEmpty
          ? MasonryGridView.count(
              primary: false,
              shrinkWrap: true,
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              itemCount: controller.productslist.length,
              itemBuilder: (BuildContext context, int index) {
                final item = controller.productslist[index];
                return Product_Card(
                  id: item.id,
                  ontap: () {
                    {
                      Page_Navigation().Page(
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
          : Center(
              child: Text('no Product'),
            )),
    );
  }
}
