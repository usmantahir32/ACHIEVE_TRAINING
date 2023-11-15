import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants/colors.dart';
import 'package:training/constants/icons.dart';
import 'package:training/controllers/article.dart';
import 'package:training/controllers/drawer.dart';
import 'package:training/models/article.dart';
import 'package:training/utils/size_config.dart';
import 'package:training/utils/spacing.dart';
import '../../../widgets/sliver_delegate.dart';
import 'components/article_card.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({super.key});

  final cont = Get.put(ArticleCont());
  final drawerCont = Get.find<DrawerCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<String> title = [
      "All",
      "For You",
      "Following",
      "News",
      "Sports",
      "Health"
    ];

    return Obx(
      () => Scaffold(
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
                    children: [
                      Spacing.y(2),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.widthMultiplier * 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                drawerCont.toggleDrawer();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: AppColors.primaryClr),
                                ),
                                child: CircleAvatar(
                                  radius: SizeConfig.imageSizeMultiplier * 3,
                                  backgroundColor: Colors.grey.shade300,
                                  backgroundImage: const NetworkImage(
                                      "https://wallpaperaccess.com/full/3297503.png"),
                                ),
                              ),
                            ),
                            Text("KNOWLEDGE BASE",
                                style: textTheme.headlineSmall),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                AppIcons.notification,
                                height: SizeConfig.imageSizeMultiplier * 6,
                              ),
                            ),
                          ],
                        ),
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Spacing.x(4),
                            ...List.generate(
                              title.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  cont.selectedContent.value = index;
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.widthMultiplier * 4,
                                    vertical: SizeConfig.heightMultiplier * .8,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.widthMultiplier * 3,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: cont.selectedContent.value == index
                                        ? AppColors.primaryClr
                                        : const Color(0xffE6E6E6),
                                  ),
                                  child: Text(
                                    title[index],
                                    style: textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: cont.selectedContent.value == index
                                          ? Colors.white
                                          : AppColors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.heightMultiplier * 1),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: SizeConfig.heightMultiplier * 2),
                            child: ArticleCard(data: articleList[index]),
                          ),
                        );
                      },
                      childCount: articleList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
