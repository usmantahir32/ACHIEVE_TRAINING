import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants/icons.dart';
import '../../../../../constants/colors.dart';
import '../../../../../controllers/subcription.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';

class SubcriptionCard extends StatelessWidget {
  SubcriptionCard({super.key, required this.indexx});

  final int indexx;
  List<String> subcriptionFeatures = [
    "Imperdiet sem",
    "Elit porttitor rutrum",
    "Et faucibus enim",
  ];
  final cont = Get.find<SubcriptionCont>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(
      () => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 378,
            width: 242,
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 6),
            margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: cont.selectedOffer.value == indexx
                      ? AppColors.primaryClr
                      : AppColors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacing.y(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$8,25",
                      style: textTheme.displayLarge!.copyWith(
                          fontSize: SizeConfig.textMultiplier * 4,
                          fontWeight: FontWeight.w600,
                          color: cont.selectedOffer.value == indexx
                              ? AppColors.primaryClr
                              : AppColors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: SizeConfig.heightMultiplier * .5),
                      child: Text(
                        " / Month",
                        style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: cont.selectedOffer.value == indexx
                                ? AppColors.primaryClr
                                : AppColors.grey),
                      ),
                    )
                  ],
                ),
                Spacing.y(1),
                Text(
                  "\$99/ year billing yearly",
                  style: textTheme.bodySmall!.copyWith(
                      color: cont.selectedOffer.value == indexx
                          ? Colors.grey.shade700
                          : AppColors.grey),
                ),
                Spacing.y(3),
                Text(
                  "12 month subscriptions",
                  style: textTheme.bodyMedium!.copyWith(
                      color: cont.selectedOffer.value == indexx
                          ? Colors.black
                          : AppColors.grey),
                ),
                Divider(
                    height: SizeConfig.heightMultiplier * 5,
                    color: cont.selectedOffer.value == indexx
                        ? AppColors.primaryClr
                        : AppColors.grey),
                ...List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.heightMultiplier * 1),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.widthMultiplier * 3),
                          child: Icon(Icons.check_circle_rounded,
                              color: cont.selectedOffer.value == indexx
                                  ? AppColors.primaryClr
                                  : AppColors.grey,
                              // color: cont.selectedOffer.value == index
                              //     ? AppColors.primaryClr
                              //     : Colors.white30,
                              size: SizeConfig.imageSizeMultiplier * 4),
                        ),
                        Text(
                          subcriptionFeatures[index],
                          style: textTheme.displaySmall!.copyWith(
                              color: cont.selectedOffer.value == indexx
                                  ? Colors.black
                                  : AppColors.grey),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: SizeConfig.heightMultiplier * 9,
              width: SizeConfig.widthMultiplier * 18,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                  gradient: cont.selectedOffer.value == indexx
                      ? LinearGradient(
                          colors: [AppColors.primaryClr, AppColors.greyDark],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)
                      : null),
              alignment: Alignment.center,
              child: Image.asset(
                cont.selectedOffer.value == indexx
                    ? AppIcons.subcription
                    : "assets/icons/ss.png",
                height: SizeConfig.imageSizeMultiplier * 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
