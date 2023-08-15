import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/MVC/views/search_result_screen.dart';
import '../../custom/all_custom_btn.dart';
import '../../custom/image_widget.dart';
import '../../custom/search_bar.dart';
import '../controller/home_controller.dart';

class Explore_Screen extends StatelessWidget {
  final controller = Get.put(home_Controller());
  RxInt selectedCategories = 0.obs;
  List imagelist = [
    'https://cdn.pixabay.com/animation/2023/06/13/15/13/15-13-33-168_512.gif',
    'https://cdn.pixabay.com/animation/2022/09/18/15/53/15-53-25-786_512.gif',
    'https://media.licdn.com/dms/image/C4D12AQGFoaWZBKIF-A/article-cover_image-shrink_600_2000/0/1634063036939?e=2147483647&v=beta&t=PufCf4n3O1C4RHjFz5Wyr6MtlvN3Viazzb3rzJJ6ciU',
    'https://images.pexels.com/photos/4279153/pexels-photo-4279153.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2022/08/30/09/40/09-40-58-504_512.gif',
    'https://images.pexels.com/photos/1092644/pexels-photo-1092644.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2022/08/22/11/10/11-10-53-252_512.gif',
    'https://images.pexels.com/photos/3747142/pexels-photo-3747142.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2023/02/13/09/42/09-42-58-584_512.gif',
    'https://cdn.pixabay.com/animation/2023/06/13/15/13/15-13-33-168_512.gif',
    'https://cdn.pixabay.com/animation/2022/09/18/15/53/15-53-25-786_512.gif',
    'https://media.licdn.com/dms/image/C4D12AQGFoaWZBKIF-A/article-cover_image-shrink_600_2000/0/1634063036939?e=2147483647&v=beta&t=PufCf4n3O1C4RHjFz5Wyr6MtlvN3Viazzb3rzJJ6ciU',
    'https://images.pexels.com/photos/4279153/pexels-photo-4279153.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2022/08/30/09/40/09-40-58-504_512.gif',
    'https://images.pexels.com/photos/1092644/pexels-photo-1092644.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2022/08/22/11/10/11-10-53-252_512.gif',
    'https://images.pexels.com/photos/3747142/pexels-photo-3747142.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2023/02/13/09/42/09-42-58-584_512.gif',
    'https://cdn.pixabay.com/animation/2023/06/13/15/13/15-13-33-168_512.gif',
    'https://media.licdn.com/dms/image/C4D12AQGFoaWZBKIF-A/article-cover_image-shrink_600_2000/0/1634063036939?e=2147483647&v=beta&t=PufCf4n3O1C4RHjFz5Wyr6MtlvN3Viazzb3rzJJ6ciU',
    'https://images.pexels.com/photos/4279153/pexels-photo-4279153.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2023/06/13/15/13/15-13-33-168_512.gif',
    'https://images.pexels.com/photos/1092644/pexels-photo-1092644.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2022/08/22/11/10/11-10-53-252_512.gif',
    'https://images.pexels.com/photos/3747142/pexels-photo-3747142.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2022/09/18/15/53/15-53-25-786_512.gif',
    'https://cdn.pixabay.com/animation/2022/08/30/09/40/09-40-58-504_512.gif',
    'https://cdn.pixabay.com/animation/2023/02/13/09/42/09-42-58-584_512.gif',
    'https://media.licdn.com/dms/image/C4D12AQGFoaWZBKIF-A/article-cover_image-shrink_600_2000/0/1634063036939?e=2147483647&v=beta&t=PufCf4n3O1C4RHjFz5Wyr6MtlvN3Viazzb3rzJJ6ciU',
    'https://images.pexels.com/photos/4279153/pexels-photo-4279153.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2022/09/18/15/53/15-53-25-786_512.gif',
    'https://cdn.pixabay.com/animation/2022/08/30/09/40/09-40-58-504_512.gif',
    'https://images.pexels.com/photos/1092644/pexels-photo-1092644.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2022/08/22/11/10/11-10-53-252_512.gif',
    'https://images.pexels.com/photos/3747142/pexels-photo-3747142.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://cdn.pixabay.com/animation/2023/02/13/09/42/09-42-58-584_512.gif',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              search_bar_widget(
                onTap: () {
                  Page_Navigation.getInstance
                      .Page(context, search_result_screen());
                },
              ),
              Obx(
                () => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // children: catename.map((e) => categories_btn(label:  , selected: selected)).toList(),
                    children: [
                      const all_custom_btn(),
                      Row(
                        children: controller.categoriesList
                            .map((e) => Obx(() => GestureDetector(
                                      onTap: () {
                                        selectedCategories.value = e.id;
                                        print('Category_Id');
                                        print(selectedCategories.value);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: selectedCategories.value ==
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
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .highlightColor,
                                                    radius: 15,
                                                    child: image_widget(
                                                        imageUrl:
                                                            e.Categoriesimage))
                                                .pOnly(right: 3),
                                            Text(
                                              e.name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    Theme.of(context).hintColor,
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
                ),
              ).p(13),
              StaggeredGrid.count(
                crossAxisCount: 6,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: List.generate(imagelist.length, (index) {
                  int crossAxisCellCount = (index % 3 == 0) ? 4 : 2;
                  int mainAxisCellCount = (index % 3 == 0) ? 4 : 2;
                  if (index == 2) {
                    crossAxisCellCount = 2;
                    mainAxisCellCount = 4;
                  } else if (index % 5 == 0) {
                    // Example: Increase size every 5 items
                    mainAxisCellCount = 3;
                  } else if (index == 3) {
                    crossAxisCellCount = 3;
                    mainAxisCellCount = 2;
                  } else {
                    mainAxisCellCount = 3;
                  }
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: mainAxisCellCount,
                    child: Image.network(
                      imagelist[index],
                      fit: BoxFit.cover, // Adjust fit as needed
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
