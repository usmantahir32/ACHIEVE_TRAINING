import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/controllers/sign_up.dart';
import 'package:training/utils/size_config.dart';
import 'package:training/utils/spacing.dart';
import 'package:training/views/pages/auth/login/login.dart';
import 'package:training/views/pages/auth/otp/otp.dart';
import 'package:training/views/widgets/auth_textfield.dart';
import 'package:training/views/widgets/custom_appbar.dart';
import 'package:training/views/widgets/custom_button.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/icons.dart';
import '../../../../controllers/auth.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cont = Get.put(SignUpCont());
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
              "Create account",
              style: textTheme.headlineLarge!.copyWith(
                fontSize: SizeConfig.textMultiplier * 3.2,
                color: AppColors.primaryClr,
              ),
            ),
            Spacing.y(1),
            Text(
              "Sign up to get started!",
              style: textTheme.bodyMedium!.copyWith(
                color: AppColors.grey,
              ),
            ),
            Spacing.y(5),
            AuthTextField(
              hintText: "Tell us your name",
              controller: cont.fullName,
              prefix: Icon(
                FeatherIcons.user,
                size: SizeConfig.imageSizeMultiplier * 5,
                color: AppColors.grey,
              ),
            ),
            AuthTextField(
              hintText: "Enter your Email address",
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
            AuthTextField(
              hintText: "Re-enter your Password",
              controller: cont.confirmPass,
              isPassword: true,
              prefix: Icon(
                FeatherIcons.lock,
                size: SizeConfig.imageSizeMultiplier * 5,
                color: AppColors.grey,
              ),
            ),
            Spacing.y(2),
            Obx(
              () => CustomButton(
                title: "Sign up",
                isLoading: authCont.isLoading.value,
                onTap: () {
                  cont.onSignup();
                  // Get.to(() => const OtpVerifyScreen(),
                  //     transition: Transition.rightToLeft);
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
                    "or sign up with",
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
                  (index) => GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        cont.onGoogleSignup();
                      }
                    },
                    child: Container(
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
                  ),
                )
              ],
            ),
            Spacing.y(7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already member?",
                  style:
                      textTheme.bodySmall!.copyWith(color: AppColors.greyDark),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(LoginScreen(), transition: Transition.downToUp);
                  },
                  child: Text(
                    "Log in",
                    style: textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryClr,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
