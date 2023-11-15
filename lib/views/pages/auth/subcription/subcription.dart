import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/utils/size_config.dart';
import 'package:training/views/pages/auth/subcription/components/card.dart';
import 'package:training/views/pages/drawer/drawer.dart';
import 'package:training/views/widgets/custom_appbar.dart';
import 'package:training/views/widgets/custom_button.dart';
import '../../../../constants/colors.dart';
import '../../../../controllers/auth.dart';
import '../../../../controllers/subcription.dart';
import '../../../../utils/spacing.dart';

class SubcriptionScreen extends StatelessWidget {
  SubcriptionScreen({super.key});
  final cont = Get.put(SubcriptionCont());
  final authCont = Get.find<AuthCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppbar(title: ""),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.y(2),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 6),
            child: Text(
              "Subcriptions",
              style: textTheme.headlineLarge!.copyWith(
                fontSize: SizeConfig.textMultiplier * 3.2,
                color: AppColors.primaryClr,
              ),
            ),
          ),
          Spacing.y(1),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 6),
            child: Text(
              "Congratulation We Have Special Offer For You",
              style: textTheme.bodyMedium!.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
          Spacing.y(5),
          SizedBox(
            height: 425,
            child: PageView.builder(
              controller: cont.pagecont,
              itemCount: 4,
              onPageChanged: (value) {
                cont.selectedOffer.value = value;
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 4),
                  child: SubcriptionCard(indexx: index),
                );
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 6),
            child: Obx(
              () => CustomButton(
                title: "Continue",
                isLoading: authCont.isLoading.value,
                onTap: () => cont.subcriptionStatus(),
              ),
            ),
          ),
          Spacing.y(4)
        ],
      ),
    );
  }
}
