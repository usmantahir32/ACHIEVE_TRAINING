import 'dart:math';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:training/constants/colors.dart';
import 'package:training/controllers/drawer.dart';
import 'package:training/controllers/workout.dart';
import 'package:training/views/pages/day%20community/day_community.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../../bottom sheets/program.dart';
import 'components/card.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({super.key});

  @override
  State<WorkOutScreen> createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  final cont = Get.put(WorkoutCont());
  final drawerCont = Get.find<DrawerCont>();
  late final PageController pagecont;

  @override
  void initState() {
    pagecont =
        PageController(initialPage: cont.selectedPage.value, keepPage: true);
    super.initState();
    if (cont.isFirst.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // final index =
        //     selectedDate.value!.day; // Day of the month starting from 1
        // final offset = (SizeConfig.widthMultiplier * 12.4) * index;

        // pagecont.jumpTo(offset);

        int pageToJump = (cont.selectedDate.value!.day / 7).ceil() - 1;
        pagecont.animateToPage(
          pageToJump,
          duration:
              const Duration(milliseconds: 300), // choose a suitable duration
          curve: Curves.easeInOut, // choose a suitable curve
        );
        cont.selectedPage.value = pageToJump;
        cont.isFirst.value = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Scaffold(
        body: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              drawerCont.toggleDrawer();
            }
          },
          child: SafeArea(
            child: Column(
              children: [
                Spacing.y(2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                    Padding(
                      padding:  EdgeInsets.only(left: SizeConfig.widthMultiplier*4),
                      child: GestureDetector(
                        onTap: () {
                          Get.bottomSheet(ProgramBottomSheet());
                        },
                        child: Container(
                          height: SizeConfig.heightMultiplier * 5,
                          width: SizeConfig.widthMultiplier * 44,
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 3),
                          decoration: BoxDecoration(
                            color: AppColors.primaryClr,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "98 Performance",
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: SizeConfig.imageSizeMultiplier * 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () =>Get.to(()=>DayCommunityScreen()),
                      icon: Icon(
                        FeatherIcons.messageCircle,
                        size: SizeConfig.imageSizeMultiplier * 6,
                      ),
                    ),
                  ],
                ),
                Spacing.y(1.5),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 7.8,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: pagecont,
                    onPageChanged: (value) {
                      cont.selectedPage.value = value;
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, pageIndex) {
                      // Assuming the month starts from 1st, calculate the start and end day for each week
                      final startDay = pageIndex * 7 + 1;
                      final endDay = min(
                          (pageIndex + 1) * 7,
                          DateTime(cont.currentDate.value!.year,
                                  cont.currentDate.value!.month + 1, 0)
                              .day);

                      return Row(
                        children: [
                          for (var day = startDay; day <= endDay; day++) ...[
                            // The widget generation code for each day
                            Builder(
                              builder: (context) {
                                final thisDate = DateTime(
                                    cont.currentDate.value!.year,
                                    cont.currentDate.value!.month,
                                    day);
                                final dayOfWeek =
                                    DateFormat('EEE').format(thisDate);
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.widthMultiplier * 4.5),
                                  child: GestureDetector(
                                    onTap: () {
                                      print(thisDate);
                                      cont.updateSelectedDate(thisDate);
                                    },
                                    child: Obx(
                                      () => AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        padding: EdgeInsets.only(
                                            top: SizeConfig.heightMultiplier *
                                                .2,
                                            left:
                                                SizeConfig.widthMultiplier * .6,
                                            right: SizeConfig.widthMultiplier *
                                                .6),
                                        decoration: BoxDecoration(
                                          color: cont.selectedDate.value ==
                                                  thisDate
                                              ? AppColors.primaryClr
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                          children: [
                                            Container(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      4,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      8,
                                              decoration: BoxDecoration(
                                                  color: cont.selectedDate
                                                              .value ==
                                                          thisDate
                                                      ? Colors.white
                                                      : AppColors.greyLightMore,
                                                  shape: BoxShape.circle),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${thisDate.day}",
                                                style: textTheme.bodyMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ),
                                            Spacing.y(.5),
                                            Text(
                                              dayOfWeek,
                                              style: textTheme.displaySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: cont.selectedDate
                                                                  .value ==
                                                              thisDate
                                                          ? Colors.white
                                                          : AppColors
                                                              .primaryClr),
                                            ),
                                            Spacing.y(1)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ]
                        ],
                      );
                    },
                    itemCount: (DateTime(cont.currentDate.value!.year,
                                    cont.currentDate.value!.month + 1, 0)
                                .day /
                            7)
                        .ceil(), // total number of weeks in a month
                  ),
                ),
                Spacing.y(1.5),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return WorkoutDetailCard();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
