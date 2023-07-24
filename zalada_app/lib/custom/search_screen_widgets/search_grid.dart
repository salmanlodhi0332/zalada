import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zalada_app/custom/product_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class search_grid extends StatelessWidget {
  const search_grid({super.key});

  @override
  Widget build(BuildContext context) {
    // HomePage_controller homePagecontroller = Get.put(HomePage_controller());

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        child:
            // Obx(
            //   // () => homePagecontroller.categoriesList.isEmpty
            //       ?
            //  GridView.count(
            //     controller: new ScrollController(keepScrollOffset: false),
            //     shrinkWrap: true,
            //     scrollDirection: Axis.vertical,
            //     addAutomaticKeepAlives: false,
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //     childAspectRatio: 0.75,
            //     primary: false,
            //     crossAxisCount: 1,
            //     children: [
            //         SizedBox(
            //           height: 50,
            //           child: Text(
            //             'No_Category_Added'.tr,
            //             style: TextStyle(
            //                 color:
            //                     Theme.of(context).hintColor.withOpacity(0.2)),
            //           ),
            //         )
            //       ])
            // :
            MasonryGridView.count(
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
              imageurl: 'assets/images/success.png',
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
