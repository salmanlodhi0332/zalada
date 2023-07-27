import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zalada_app/utiles/page_navigation.dart';
import 'package:zalada_app/MVC/views/search_result_screen.dart';
import '../../custom/all_custom_btn.dart';
import '../../custom/explore_screen_widgets/videos_widget.dart';
import '../../custom/search_bar.dart';
import '../../custom/search_screen_widgets/categories_btn.dart';

class Explore_Screen extends StatefulWidget {
  @override
  State<Explore_Screen> createState() => _Explore_ScreenState();
}

class _Explore_ScreenState extends State<Explore_Screen> {
  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://www.youtube.com/watch?v=-UJCMfuFtSQ&ab_channel=HarryStylesVEVO',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://www.youtube.com/watch?v=xudE1JxfAZQ&ab_channel=saurabhsingh',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://www.youtube.com/watch?v=-UJCMfuFtSQ&ab_channel=HarryStylesVEVO',
    // Add more video URLs here...
  ];
// final playerWidget = Chewie(
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            search_bar_widget(
              onTap: () {
                Page_Navigation.getInstance
                    .Page(context, search_result_screen());
              },
            ),
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
              ).px(20),
            ).py(20),

            // GridView.builder(
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2, // Adjust the number of columns as needed
            //   ),
            //   itemCount: videoUrls.length,
            //   itemBuilder: (context, index) {
            //     final videoUrl = videoUrls[index];
            //     return VideoItem(videoUrl: videoUrl);
            //   },
            // ),
            StaggeredGrid.count(
              // primary: false,
              // shrinkWrap: true,
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: videoUrls.map((e) {
                return VideoItem(videoUrl: e);
                // return StaggeredGridTile.count(
                //     crossAxisCellCount: 2,
                //     mainAxisCellCount: 2,
                //     child: VideoItem(videoUrl: e)
                //     );
              }).toList(),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 2,
              //   mainAxisCellCount: 2,
              //   child: Tile(index: 0),
              // ),
              // padding: EdgeInsets.symmetric(horizontal: 5),
              // itemCount: videoUrls.length,
              // itemBuilder: (context, index) {
              //   final videoUrl = videoUrls[index];
              //   return VideoItem(videoUrl: videoUrl);
              // },
              // return Product_Card(
              //   ontap: () {
              //     {
              //       Page_Navigation().Page(
              //           context,
              //           Product_Detail_Screen(
              //             id: item.id,
              //           ));
              //     }
              //   },
              //   imageurl: item.images[0],
              //   product_name: item.name,
              //   price: '\$' + item.price,
              //   status: "NEW ARRIVAL",
            )
          ],
        ),
      ),
    );
  }
}
