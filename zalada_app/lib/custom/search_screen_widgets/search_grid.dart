import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zalada_app/custom/product_card.dart';

import 'package:zalada_app/views/product_detail.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class search_grid extends StatelessWidget {
  const search_grid({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: MasonryGridView.count(
          primary: false,
          shrinkWrap: true,
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 4,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Product_Card(
              ontap: () {
                {
                  Page_Navigation()
                      .Page_ReplaceNavigation(context, Product_Detail_Screen());
                }
              },
              imageurl: 'assets/images/item.png',
              product_name: 'Macbook Pro 15" 2019 -Intel corei7',
              price: '\$1240',
              status: "NEW ARRIVAL",
            );
          },
          mainAxisSpacing: 50.0,
          crossAxisSpacing: 15.0,
        ),
        // ),
      ),
    );
  }
}
