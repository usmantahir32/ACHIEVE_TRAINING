import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants/colors.dart';
import 'package:training/controllers/profile.dart';
import 'package:training/views/widgets/custom_appbar.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';

class PreferencesScreen extends StatelessWidget {
  PreferencesScreen({super.key});
  final cont = Get.find<ProfileCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppbar(title: ""),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Spacing.y(2),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "MY PREFERENCES",
                  style: textTheme.headlineLarge!.copyWith(
                    fontSize: SizeConfig.textMultiplier * 3.2,
                    color: AppColors.primaryClr,
                  ),
                ),
              ),
            ),
            Spacing.y(2),
            Obx(
              () => PreferencesTile(
                title: "Email notification",
                icon: Icons.email,
                switchVal: cont.isEmailNoti.value,
                onSwitchTap: (val) {
                  cont.isEmailNoti.value = val;
                },
              ),
            ),
            Obx(
              () => PreferencesTile(
                title: "Push notification",
                icon: Icons.notifications_rounded,
                switchVal: cont.isPushNoti.value,
                onSwitchTap: (val) {
                  cont.isPushNoti.value = val;
                },
              ),
            ),
            Obx(
              () => PreferencesTile(
                title: "Hide my name on leaderboard",
                icon: Icons.person_2_rounded,
                switchVal: cont.isNameLeaderboard.value,
                onSwitchTap: (val) {
                  cont.isNameLeaderboard.value = val;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreferencesTile extends StatelessWidget {
  const PreferencesTile(
      {super.key,
      required this.title,
      this.onSwitchTap,
      this.switchVal,
      required this.icon});
  final String title;
  final bool? switchVal;
  final IconData icon;
  final Function(bool)? onSwitchTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(
          top: onSwitchTap != null
              ? SizeConfig.heightMultiplier * .85
              : SizeConfig.heightMultiplier * 1,
          bottom: onSwitchTap != null
              ? SizeConfig.heightMultiplier * .85
              : SizeConfig.heightMultiplier * 1,
          left: SizeConfig.widthMultiplier * 4,
          right: onSwitchTap != null
              ? SizeConfig.widthMultiplier * 2
              : SizeConfig.widthMultiplier * 4),
      child: Row(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 3.5,
            width: SizeConfig.widthMultiplier * 7.5,
            margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200),
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: SizeConfig.imageSizeMultiplier * 5,
              color: AppColors.primaryClr,
            ),
          ),
          Text(
            title,
            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Transform.scale(
            scale: .7,
            child: CupertinoSwitch(
                activeColor: AppColors.primaryClr,
                value: switchVal!,
                onChanged: onSwitchTap),
          )
        ],
      ),
    );
  }
}
