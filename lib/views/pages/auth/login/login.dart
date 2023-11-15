import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:training/constants/icons.dart';
import 'package:training/controllers/auth.dart';
import 'package:training/controllers/login.dart';
import 'package:training/utils/size_config.dart';
import 'package:training/utils/spacing.dart';
import 'package:training/views/pages/auth/forgot/forgot.dart';
import 'package:training/views/pages/auth/sign%20up/sign_up.dart';
import 'package:training/views/pages/bottom%20nav%20bar/bottom_nav_bar.dart';
import 'package:training/views/pages/drawer/drawer.dart';
import 'package:training/views/widgets/auth_textfield.dart';
import 'package:training/views/widgets/custom_appbar.dart';
import 'package:training/views/widgets/custom_button.dart';

import '../../../../constants/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final cont = Get.put(LoginCont());
  final authCont = Get.find<AuthCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<String> socialIcon = [
      AppIcons.google,
      AppIcons.facebook,
      AppIcons.apple
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppbar(title: ""),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.y(2),
            Text(
              "Welcome back",
              style: textTheme.headlineLarge!.copyWith(
                fontSize: SizeConfig.textMultiplier * 3.2,
                color: AppColors.primaryClr,
              ),
            ),
            Spacing.y(1),
            Text(
              "Enter your details to continue",
              style: textTheme.bodyMedium!.copyWith(
                color: AppColors.grey,
              ),
            ),
            Spacing.y(5),
            AuthTextField(
              hintText: "Email or username",
              controller: cont.email,
              prefix: Icon(
                FeatherIcons.user,
                size: SizeConfig.imageSizeMultiplier * 5,
                color: AppColors.grey,
              ),
            ),
            AuthTextField(
              hintText: "Password",
              controller: cont.pass,
              isPassword: true,
              prefix: Icon(
                FeatherIcons.lock,
                size: SizeConfig.imageSizeMultiplier * 5,
                color: AppColors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => ForgotScreen(),
                    transition: Transition.rightToLeft);
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password?",
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryClr,
                  ),
                ),
              ),
            ),
            Spacing.y(3),
            Obx(
              () => CustomButton(
                title: "Log in",
                isLoading: authCont.isLoading.value,
                onTap: () {
                  // Get.to(() => DrawerScreen(),
                  //     transition: Transition.rightToLeft);
                  cont.onLogin();
                },
              ),
            ),
            Spacing.y(5),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 4),
                  child: Text(
                    "or log in with",
                    style: textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Spacing.y(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  socialIcon.length,
                  (index) => Container(
                    height: SizeConfig.heightMultiplier * 5,
                    width: SizeConfig.widthMultiplier * 11,
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 1.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greyLightMore,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: Image.asset(
                          socialIcon[index],
                          height: index == 1
                              ? SizeConfig.imageSizeMultiplier * 8
                              : SizeConfig.imageSizeMultiplier * 5,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Spacing.y(22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style:
                      textTheme.bodySmall!.copyWith(color: AppColors.greyDark),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(SignUpScreen(), transition: Transition.downToUp);
                    },
                    child: Text(
                      "Sign up",
                      style: textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryClr,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
