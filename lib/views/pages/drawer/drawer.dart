import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:training/constants/icons.dart';
import 'package:training/controllers/auth.dart';
import 'package:training/controllers/profile.dart';
import 'package:training/views/pages/bottom%20nav%20bar/bottom_nav_bar.dart';
import '../../../constants/colors.dart';
import '../../../constants/controller.dart';
import '../../../controllers/drawer.dart';
import '../../../utils/size_config.dart';
import '../../../utils/spacing.dart';
import '../../widgets/confirmation_dialog.dart';
import '../auth/change email/change_email.dart';
import '../auth/change password/change_password.dart';
import '../personal info/personal_info.dart';
import '../preferences/preferences.dart';
import 'components/drawer_tile.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});

  final cont = Get.put(DrawerCont());
  final profileCont = Get.put(ProfileCont());

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: cont.zoomDrawerController,
      menuScreen: MenuDrawer(),
      menuBackgroundColor: AppColors.primaryClr,
      mainScreen: BottomNavBarScreen(),
      borderRadius: 30,
      shadowLayer1Color: Colors.white24,
      shadowLayer2Color: Colors.white38,
      showShadow: true,
      mainScreenScale: .14,
      angle: 0,
      menuScreenWidth: SizeConfig.widthMultiplier * 100,
      style: DrawerStyle.defaultStyle,
      slideWidth: MediaQuery.of(context).size.width * 0.67,
    );
  }
}

class MenuDrawer extends StatelessWidget {
  MenuDrawer({
    super.key,
  });

  final cont = Get.find<DrawerCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.primaryClr,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
              child: CircleAvatar(
                radius: SizeConfig.imageSizeMultiplier * 12,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: const NetworkImage(
                    "https://wallpaperaccess.com/full/3297503.png"),
              ),
            ),
            Spacing.y(1),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4),
              child: Text(
                authCont.userModel.value.name!,
                style: textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4),
              child: Text(
                authCont.userModel.value.email!,
                style: textTheme.bodySmall!.copyWith(color: Colors.white24),
              ),
            ),
            Spacing.y(3),
            SettingTile(
              title: "Manage subcription",
              icon: CupertinoIcons.money_dollar_circle,
              onTap: () {},
            ),
            SettingTile(
              title: "Change email",
              icon: CupertinoIcons.mail,
              onTap: () {
                cont.toggleDrawer();
                Get.to(() => ChangeEmailScreen(),
                    transition: Transition.rightToLeft);
              },
            ),
            SettingTile(
              title: "Change password",
              icon: CupertinoIcons.lock,
              onTap: () {
                cont.toggleDrawer();

                Get.to(() => ChangePasswordScreen(),
                    transition: Transition.rightToLeft);
              },
            ),
            SettingTile(
              title: "Personal Information",
              icon: CupertinoIcons.person,
              onTap: () {
                cont.toggleDrawer();

                Get.to(() => PersonalInfoScreen(),
                    transition: Transition.rightToLeft);
              },
            ),
            SettingTile(
              title: "Preferences",
              icon: CupertinoIcons.settings,
              onTap: () {
                cont.toggleDrawer();

                Get.to(() => PreferencesScreen(),
                    transition: Transition.rightToLeft);
              },
            ),
            SettingTile(
              title: "Delete account",
              icon: CupertinoIcons.delete_simple,
              onTap: () {
                cont.toggleDrawer();

                Get.dialog(
                  ConfirmationDialog(
                    title: "Confirm Delete Account?",
                    height: SizeConfig.heightMultiplier * 43,
                    subtitle:
                        "Deleting your account is a permanent action and cannot be undone. You will lose all your data, preferences, and history associated with this account. Are you sure you want to proceed and permanently delete your account?",
                    onContinue: () {
                      authCont.deleteAccount();
                    },
                  ),
                );
              },
            ),
            const Spacer(),
            SettingTile(
              title: "Logout",
              icon: Icons.logout_rounded,
              onTap: () {
                cont.toggleDrawer();

                Get.dialog(
                  ConfirmationDialog(
                    height: SizeConfig.heightMultiplier * 38,
                    title: "Confirm Logout?",
                    subtitle:
                        "You will be signed out of your account an need to sign in again to access personalized content and features. Are you sure you want to log out?",
                    onContinue: () {
                      authCont.signout();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
