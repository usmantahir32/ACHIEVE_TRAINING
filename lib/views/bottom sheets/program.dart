import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controllers/workout.dart';
import '../../utils/size_config.dart';
import '../../utils/spacing.dart';

class ProgramBottomSheet extends StatelessWidget {
  ProgramBottomSheet({super.key});

  final cont = Get.find<WorkoutCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<String> programsTitle = [
      "98 Capacity",
      "98 Groundwork",
      "98 Hybrid",
      "98 Performance",
      "98 Strenght"
    ];

    return Obx(
      () => SingleChildScrollView(
        child: Container(
          width: SizeConfig.widthMultiplier * 100,
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.heightMultiplier * 2,
            horizontal: SizeConfig.widthMultiplier * 4,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Program",
                style: textTheme.headlineLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "WHICH PROGRAM IS FOR ME?",
                style: textTheme.displaySmall!.copyWith(color: Colors.black38),
              ),
              Spacing.y(3),
              Align(
                alignment: Alignment.bottomLeft,
                child: Wrap(
                  // runAlignment: WrapAlignment.start,
                  spacing: SizeConfig.widthMultiplier * 3,
                  runSpacing: SizeConfig.heightMultiplier * 1,
                  alignment: WrapAlignment.start,
                  children: [
                    ...List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          cont.selectedprogram.value = index;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 7,
                              vertical: SizeConfig.heightMultiplier * 1),
                          decoration: BoxDecoration(
                            color: cont.selectedprogram.value == index
                                ? AppColors.primaryClr
                                : const Color(0xffE6E6E6),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            programsTitle[index],
                            style: textTheme.bodyMedium!.copyWith(
                                color: cont.selectedprogram.value == index
                                    ? Colors.white
                                    : AppColors.grey),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
