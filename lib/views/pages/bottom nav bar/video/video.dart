import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/drawer.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../../widgets/sliver_delegate.dart';
import 'components/card.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({super.key});
  final drawerCont = Get.find<DrawerCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<String> images = [
      "https://t4.ftcdn.net/jpg/03/17/72/47/360_F_317724775_qHtWjnT8YbRdFNIuq5PWsSYypRhOmalS.jpg",
      "https://media.istockphoto.com/id/1322158059/photo/dumbbell-water-bottle-towel-on-the-bench-in-the-gym.jpg?b=1&s=612x612&w=0&k=20&c=b13H5TTS1fK3L22PonClTd5L4B6_Ol4cucmOQOgeuWQ=",
      "https://tropeaka.com/cdn/shop/articles/main_image_d517c79f-4ec7-4946-bb5e-db7e80623e85_1080x.jpg?v=1571697737",
      "https://mensfitnesstoday.com/wp-content/uploads/sites/2/2022/11/squat_1-min-min_compressed-1.jpg?w=799",
      "https://marathonhandbook.com/wp-content/uploads/2022/08/Total-Body-Gym-Workout.jpg",
      "https://t4.ftcdn.net/jpg/03/17/72/47/360_F_317724775_qHtWjnT8YbRdFNIuq5PWsSYypRhOmalS.jpg",
      "https://media.istockphoto.com/id/1322158059/photo/dumbbell-water-bottle-towel-on-the-bench-in-the-gym.jpg?b=1&s=612x612&w=0&k=20&c=b13H5TTS1fK3L22PonClTd5L4B6_Ol4cucmOQOgeuWQ=",
      "https://tropeaka.com/cdn/shop/articles/main_image_d517c79f-4ec7-4946-bb5e-db7e80623e85_1080x.jpg?v=1571697737",
      "https://mensfitnesstoday.com/wp-content/uploads/sites/2/2022/11/squat_1-min-min_compressed-1.jpg?w=799",
      "https://marathonhandbook.com/wp-content/uploads/2022/08/Total-Body-Gym-Workout.jpg",
    ];

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            drawerCont.toggleDrawer();
          }
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacing.y(2),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 4),
                      child: Text("MOVEMENT LIBRARY",
                          style: textTheme.headlineSmall),
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: SliverAppBarDelegate(
                  minHeight: SizeConfig.heightMultiplier * 9,
                  maxHeight: SizeConfig.heightMultiplier * 9,
                  child: Container(
                    color: const Color(0xFFF5F6FA),
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 4),
                          child: CupertinoSearchTextField(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.widthMultiplier * 2,
                                vertical: SizeConfig.heightMultiplier * 1.5),
                            prefixInsets: EdgeInsets.only(
                                left: SizeConfig.widthMultiplier * 2),
                            suffixInsets: EdgeInsets.only(
                                right: SizeConfig.widthMultiplier * 2),
                          ),
                        ),
                        // SizedBox(height: SizeConfig.heightMultiplier * 2),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 4,
                    vertical: SizeConfig.heightMultiplier * 1),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return VideoCard(
                        i: index,
                        images: images[index],
                      );
                    },
                    childCount: images.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: SizeConfig.widthMultiplier * 4,
                    childAspectRatio: 1,
                    mainAxisSpacing: SizeConfig.heightMultiplier * 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
