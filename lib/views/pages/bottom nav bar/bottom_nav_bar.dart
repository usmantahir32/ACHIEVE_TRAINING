import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants/controller.dart';
import 'package:training/views/pages/bottom%20nav%20bar/article/article.dart';
import 'package:training/views/pages/bottom%20nav%20bar/community/community.dart';
import 'package:training/views/pages/bottom%20nav%20bar/leaderboard/leaderboard.dart';
import 'package:training/views/pages/bottom%20nav%20bar/video/video.dart';
import 'package:training/views/pages/bottom%20nav%20bar/workout/workout.dart';
import '../../../constants/colors.dart';
import '../../../controllers/bottom_nav_bar.dart';
import '../../../utils/size_config.dart';

class BottomNavBarScreen extends StatelessWidget {
  final cont = Get.put(BottomNavBarCont());

  List pages = [
    ArticleScreen(),
    VideoScreen(),
    WorkOutScreen(),
    LeaderBoardScreen(),
    CommunityScreen()
  ];

  BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => pages.elementAt(cont.selectedIndex.value),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 9,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 20)
                ],
                borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.only(
                left: SizeConfig.widthMultiplier * 2,
                right: SizeConfig.widthMultiplier * 2,
                bottom: SizeConfig.heightMultiplier * .7),
          ),
          //BOTTOM NAV BAR BUTTONS
          Positioned(
            bottom: SizeConfig.heightMultiplier * .7,
            child: Obx(
              () => Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => _bnbItem(index, context),
                  )
                ],
              ),
            ),
          ),

          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              left: _dotLocation(cont.selectedIndex.value, context),
              curve: Curves.easeOutSine,
              bottom: SizeConfig.heightMultiplier * 3.5,
              child: Container(
                height: SizeConfig.heightMultiplier * .5,
                width: SizeConfig.widthMultiplier * 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.primaryClr),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _bnbItem(int index, BuildContext context) {
    String iconPath;
    switch (index) {
      case 0:
        iconPath = cont.selectedIndex.value == index
            ? "assets/icons/articles_filled.png"
            : "assets/icons/articles_unfilled.png";
        break;
      case 1:
        iconPath = cont.selectedIndex.value == index
            ? "assets/icons/videos_filled.png"
            : "assets/icons/videos_unfilled.png";
        break;
      case 2:
        iconPath = cont.selectedIndex.value == index
            ? "assets/icons/calendar_filled.png"
            : "assets/icons/calendar_unfilled.png";
        break;
      case 3:
        iconPath = cont.selectedIndex.value == index
            ? "assets/icons/medal_unfilled.png"
            : "assets/icons/medal_unfilled.png";
        break;
      case 4:
        iconPath = cont.selectedIndex.value == index
            ? "assets/icons/community_filled.png"
            : "assets/icons/community_unfilled.png";
        break;
      default:
        iconPath = ""; // Handle other cases if needed
        break;
    }

    return InkWell(
      onTap: () {
        cont.selectedIndex.value = index;
      },
      child: SizedBox(
        height: SizeConfig.heightMultiplier * 9,
        width: SizeConfig.widthMultiplier * 19.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 2.5),
            Image.asset(
              iconPath,
              color: cont.selectedIndex.value == index
                  ? AppColors.primaryClr
                  : Colors.grey.shade400,
              height: index == 0 || index == 2
                  ? SizeConfig.imageSizeMultiplier * 6.5
                  : index == 1
                      ? SizeConfig.imageSizeMultiplier * 5.5
                      : SizeConfig.imageSizeMultiplier * 6,
            ),
          ],
        ),
      ),
    );
  }

  double _dotLocation(int index, BuildContext context) {
    return index == 0
        ? SizeConfig.widthMultiplier * 9
        : index == 1
            ? SizeConfig.widthMultiplier * 28.5
            : index == 2
                ? SizeConfig.widthMultiplier * 48
                : index == 3
                    ? SizeConfig.widthMultiplier * 67.5
                    : index == 4
                        ? SizeConfig.widthMultiplier * 87
                        : SizeConfig.widthMultiplier * 87;
  }
}
